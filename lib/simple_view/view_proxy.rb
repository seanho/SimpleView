module SimpleView
  class ViewProxy
    attr_reader :view

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
      options = extended_options_for_class klass, options

      if SimpleView::Builders.const_defined? builder_class
        SimpleView::Builders.const_get(builder_class).new.build klass, options
      else
        if klass < UIControl
          SimpleView::Builders::UIControlBuilder.new.build klass, options
        else
          SimpleView::Builders::UIViewBuilder.new.build klass, options
        end
      end
    end

    def extended_options_for_class klass, options = {}
      class_style = SimpleView::Styles.for(klass) || {}
      custom_styles = options.delete(:styles)

      if custom_styles.is_a?(Symbol)
        style = SimpleView::Styles.for(custom_styles)
        class_style.update(style) if style

      elsif custom_styles.is_a?(Array)
        custom_styles.each do |custom_style|
          style = SimpleView::Styles.for(custom_style)
          class_style.update(style) if style
        end
      end

      class_style.update(options)
    end

    def add klass, options = {}, &block
      subview = build_view klass, options

      @view.addSubview(subview) unless @view.nil?

      if block_given?
        child_layout = ViewProxy.new(subview, @locals)
        child_layout.instance_eval &block
      end

      subview.sizeToFit if options[:width].nil? && options[:height].nil? && options[:right].nil? && options[:bottom].nil?
      subview.invalidate_size
      subview
    end

    [::UIActionSheet, ::UIActivityIndicatorView, ::UIButton, ::UIDatePicker, ::UIImageView, ::UILabel, ::UIPageControl,
      ::UIPickerView, ::UIProgressView, ::UIScrollView, ::UISearchBar, ::UISegmentedControl, ::UISlider,
      ::UIStepper, ::UISwitch, ::UITabBar, ::UITableView, ::UITableViewCell, ::UITextField, ::UITextView,
      ::UIToolbar, ::UIWebView].each do |klass|
      shorthand = "#{klass}"[2..-1].underscore.to_sym
      define_method(shorthand) do |*args, &block|
        options = args[0] || {}
        add(klass, options, &block)
      end
    end
    def rect(options = {}, &block) add(::UIView, options, &block); end
  end
end