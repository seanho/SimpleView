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

    def add klass, options = {}, &block
      subview = build_view klass, options
      subview.translatesAutoresizingMaskIntoConstraints = false

      @view.addSubview(subview) unless @view.nil?

      if block_given?
        child_layout = ViewProxy.new(subview, @locals)
        child_layout.instance_eval &block
      end

      subview.sizeToFit if options[:width].nil? && options[:height].nil? && options[:right].nil? && options[:bottom].nil?
      subview.translate_anchors_into_constraints
      subview
    end

    [::UIActivityIndicatorView, ::UIButton, ::UIDatePicker, ::UIImageView, ::UILabel, ::UIPageControl,
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