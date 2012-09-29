module Simple
  class Layouts
    attr_reader :view

    def self.setup view, locals = {}, &block
      layout = Layouts.new view, locals
      layout.instance_eval &block
    end

    def initialize view = nil, locals = {}
      @view = view
      @locals = locals

      if @locals
        @locals.each do |k, v|
          self.class.send :attr_accessor, k
          self.instance_variable_set "@#{k}", v
        end
      end
    end

    def build_view klass, options = {}
      builder_class = "#{klass}Builder"

      if Simple.const_defined? builder_class
        Simple.const_get(builder_class).new.build klass, options
      else
        if klass < UIControl
          UIControlBuilder.new.build klass, options
        else
          UIViewBuilder.new.build klass, options
        end
      end
    end

    def add klass, options = {}, &block
      subview = build_view klass, options

      @view.addSubview(subview) unless @view.nil?

      if block_given?
        child_layout = Layouts.new(subview, @locals)
        child_layout.instance_eval &block
      end

      subview.invalidate_size
      subview
    end

    def activity_indicator(options = {}, &block)  add(UIActivityIndicatorView, options, &block); end
    def button(options = {}, &block)              add(UIButton, options, &block); end
    def date_picker(options = {}, &block)         add(UIDatePicker, options, &block); end
    def image_view(options = {}, &block)          add(UIImageView, options, &block); end
    def label(options = {}, &block)               add(UILabel, options, &block); end
    def page_control(options = {}, &block)        add(UIPageControl, options, &block); end
    def picker_view(options = {}, &block)         add(UIPickerView, options, &block); end
    def progress_view(options = {}, &block)       add(UIProgressView, options, &block); end
    def rect(options = {}, &block)                add(UIView, options, &block); end
    def scroll_view(options = {}, &block)         add(UIScrollView, options, &block); end
    def search_bar(options = {}, &block)          add(UISearchBar, options, &block); end
    def segmented_control(options = {}, &block)   add(UISegmentedControl, options, &block); end
    def slider(options = {}, &block)              add(UISlider, options, &block); end
    def stepper(options = {}, &block)             add(UIStepper, options, &block); end
    def switch(options = {}, &block)              add(UISwitch, options, &block); end
    def tab_bar(options = {}, &block)             add(UITabBar, options, &block); end
    def table_view(options = {}, &block)          add(UITableView, options, &block); end
    def table_view_cell(options = {}, &block)     add(UITableViewCell, options, &block); end
    def text_field(options = {}, &block)          add(UITextField, options, &block); end
    def text_view(options = {}, &block)           add(UITextView, options, &block); end
    def toolbar(options = {}, &block)             add(UIToolbar, options, &block); end
    def web_view(options = {}, &block)            add(UIWebView, options, &block); end
  end

  class Styles
    @@repo = {}

    def self.define name, options = {}
      existing = @@repo[name] || {}
      @@repo[name] = existing.update(options)
    end

    def self.for name
      @@repo[name]
    end
  end
end