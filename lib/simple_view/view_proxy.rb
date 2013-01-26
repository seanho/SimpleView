module SimpleView
  class ViewProxy
    attr_reader :view, :locals

    def initialize view = nil, locals = {}
      @view = view
      @locals = locals

      if !@locals.nil?
        @locals.each do |k, v|
          self.class.send :attr_accessor, k
          self.instance_variable_set "@#{k}", v
        end
      end
    end

    def add klass, options = {}, &block
      subview = create klass, options, &block
      view.addSubview(subview) unless view.nil?
      subview
    end

    def create klass, options = {}, &block
      bounds = view.nil? ? CGRectZero : view.bounds
      subview = ViewBuilder.view_for klass, bounds, options

      if block_given?
        child_layout = ViewProxy.new subview, locals
        child_layout.instance_exec subview, &block
      end

      subview
    end

    [::UIActionSheet, ::UIActivityIndicatorView, ::UIButton, ::UIDatePicker, ::UIImageView, ::UILabel,
      ::UIPageControl, ::UIPickerView, ::UIProgressView, ::UIScrollView, ::UISearchBar, ::UISegmentedControl,
      ::UISlider, ::UIStepper, ::UISwitch, ::UITabBar, ::UITableView, ::UITableViewCell, ::UITextField, ::UITextView,
      ::UIToolbar, ::UIWebView].each do |klass|
      shorthand = "#{klass}"[2..-1].underscore.to_sym
      define_method(shorthand) do |*args, &block|
        options = args[0] || {}
        add klass, options, &block
      end
    end
    def rect(options = {}, &block) add(::UIView, options, &block); end
  end
end