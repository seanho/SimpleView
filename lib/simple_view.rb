module UI
  class Layouts
    attr_accessor :view, :locals
    
    def self.setup(view = nil, locals = {}, &block)
      layout = Layouts.new(view, locals)
      layout.instance_eval &block
    end

    def initialize(view = nil, locals = {})
      @view = view
      @locals = locals
      @locals.each do |k,v|
        self.class.send(:attr_accessor, k)
        self.instance_variable_set "@#{k}", v
      end
    end
    
    def add(klass, options = {}, &block)
      subview = ViewBuilder.build(klass, options)
      
      if block_given?
        child_layout = Layouts.new(subview, @locals)
        child_layout.instance_eval &block
      end
      
      @view.addSubview(subview) unless @view.nil?
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
    
    def self.define(name, options = {})
      existing = @@repo[name] || {}
      @@repo[name] = existing.update(options)
    end
    
    def self.for(name)
      @@repo[name]
    end
  end
  
  class ViewBuilder
    @@builders = {
      UIView                  => UIViewBuilder.new,
      UIControl               => UIControlBuilder.new,
      UIActivityIndicatorView => UIActivityIndicatorViewBuilder.new,
      UIButton                => UIButtonBuilder.new,
      UIImageView             => UIImageViewBuilder.new,
      UILabel                 => UILabelBuilder.new,
      UIProgressView          => UIProgressViewBuilder.new,
      UISearchBar             => UISearchBarBuilder.new,
      UISegmentedControl      => UISegmentedControlBuilder.new,
      UISlider                => UISliderBuilder.new,
      UISwitch                => UISwitchBuilder.new,
      UITabBar                => UITabBarBuilder.new,
      UITableView             => UITableViewBuilder.new,
      UITableViewCell         => UITableViewCellBuilder.new,
      UITextField             => UITextFieldBuilder.new,
      UITextView              => UITextViewBuilder.new,
      UIToolbar               => UIToolbarBuilder.new
    }
    
    def self.build(klass, options = {})
      if @@builders.has_key?(klass)
        builder = @@builders[klass]
      elsif klass < UIControl
        builder = @@builders[UIControl]
      else
        builder = @@builders[UIView]
      end
      
      builder.build(klass, options)
    end
    
    def self.register(klass, builder)
      @@builders[klass] = builder
    end
  end
end