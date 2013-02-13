module SimpleView
  module Layout
    extend self

    def setup view, &block
      view_stack.push view
      block.call if block_given?
      view_stack.pop
    end

    def add_view klass, options = {}, &block
      subview = create_view klass, options, &block

      view_stack.last.addSubview(subview) unless view_stack.empty?

      subview
    end

    def create_view klass, options = {}, &block
      bounds = view_stack.empty? ? CGRectZero : view_stack.last.bounds
      subview = ViewBuilder.view_for klass, bounds, options

      view_stack.push subview
      block.call(subview) if block_given?
      view_stack.pop

      subview
    end

    def view_stack
      @view_stack ||= []
    end

    def self.included base
      base.class_eval do
        [::UIActionSheet, ::UIActivityIndicatorView, ::UIButton, ::UIDatePicker, ::UIImageView, ::UILabel,
          ::UIPageControl, ::UIPickerView, ::UIProgressView, ::UIScrollView, ::UISearchBar, ::UISegmentedControl,
          ::UISlider, ::UIStepper, ::UISwitch, ::UITabBar, ::UITableView, ::UITableViewCell, ::UITextField, ::UITextView,
          ::UIToolbar, ::UIWebView].each do |klass|

          shorthand = "#{klass}"[2..-1].underscore.to_sym

          define_method(shorthand) do |*args, &block|
            options = args[0] || {}
            add_view klass, options, &block
          end
        end
        def rect(options = {}, &block) add_view(::UIView, options, &block); end
      end
    end
  end
end