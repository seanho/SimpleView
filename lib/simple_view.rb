module UI
  class Layout
    STRUCTS_MAP = {
      CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
      CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
      CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
      CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
      UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
      UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
    }
    
    attr_accessor :view, :locals
    
    def self.setup(view = nil, locals = {}, &block)
      layout = Layout.new(view, locals)
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
      
      unless options.nil?
        options.each do |k,v|
          options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
        end
        subview.setValuesForKeysWithDictionary(options)
      end
      
      if block_given?
        child_layout = Layout.new(subview, @locals)
        child_layout.instance_eval &block
      end
      
      @view.addSubview(subview) unless @view.nil?
      subview
    end

    def button(options = {}, &block)            add(UIButton, options, &block); end
    def date_picker(options = {}, &block)       add(UIDatePicker, options, &block); end
    def image_view(options = {}, &block)        add(UIImageView, options, &block); end
    def label(options = {}, &block)             add(UILabel, options, &block); end
    def page_control(options = {}, &block)      add(UIPageControl, options, &block); end
    def picker_view(options = {}, &block)       add(UIPickerView, options, &block); end
    def progress_view(options = {}, &block)     add(UIProgressView, options, &block); end
    def scroll_view(options = {}, &block)       add(UIScrollView, options, &block); end
    def search_bar(options = {}, &block)        add(UISearchBar, options, &block); end
    def segmented_control(options = {}, &block) add(UISegmentedControl, options, &block); end
    def slider(options = {}, &block)            add(UISlider, options, &block); end
    def stepper(options = {}, &block)           add(UIStepper, options, &block); end
    def switch(options = {}, &block)            add(UISwitch, options, &block); end
    def tab_bar(options = {}, &block)           add(UITabBar, options, &block); end
    def table_view(options = {}, &block)        add(UITableView, options, &block); end
    def table_view_cell(options = {}, &block)   add(UITableViewCell, options, &block); end
    def text_field(options = {}, &block)        add(UITextField, options, &block); end
    def text_view(options = {}, &block)         add(UITextView, options, &block); end
    def toolbar(options = {}, &block)           add(UIToolbar, options, &block); end
    def web_view(options = {}, &block)          add(UIWebView, options, &block); end
  end
  
  class ViewBuilder
    @@builders = {
      UIView              => Proc.new {|klass, options| ViewBuilder.create_ui_view(klass, options) },
      UIControl           => Proc.new {|klass, options| ViewBuilder.create_ui_control(klass, options) },
      UIButton            => Proc.new {|klass, options| ViewBuilder.create_ui_button(klass, options) },
      UIImageView         => Proc.new {|klass, options| ViewBuilder.create_ui_image_view(klass, options) },
      UIProgressView      => Proc.new {|klass, options| ViewBuilder.create_ui_progress_view(klass, options) },
      UISegmentedControl  => Proc.new {|klass, options| ViewBuilder.create_ui_segmented_control(klass, options) },
      UITableView         => Proc.new {|klass, options| ViewBuilder.create_ui_table_view(klass, options) },
      UITableViewCell     => Proc.new {|klass, options| ViewBuilder.create_ui_table_view_cell(klass, options) }
    }
    
    def self.build(klass, options = {})
      if @@builders.has_key?(klass)
        builder = @@builders[klass]
      elsif klass < UIControl
        builder = @@builders[UIControl]
      else
        builder = @@builders[UIView]
      end
      builder.call(klass, options)
    end
    
    def self.register(klass, proc)
      @@builders[klass] = proc
    end
    
    private
    
    def self.create_ui_view(klass, options = {})
      klass.alloc.initWithFrame(CGRectZero)
    end
    
    def self.create_ui_control(klass, options = {})
      klass.alloc.init
    end
    
    def self.create_ui_button(klass, options = {})
      button_type = options.delete(:buttonType) || UIButtonTypeRoundedRect
      UIButton.buttonWithType(button_type)
    end
    
    def self.create_ui_image_view(klass, options = {})
      image = options.delete(:image)
      highlighted_image = options.delete(:highlightedImage)
      if image && highlighted_image
        UIImageView.alloc.initWithImage(image, highlightedImage:highlighted_image)
      elsif image
        UIImageView.alloc.initWithImage(image)
      else
        UIImageView.alloc.initWithFrame(CGRectZero)
      end
    end
    
    def self.create_ui_progress_view(klass, options = {})
      style = options.delete(:style) || UIProgressViewStyleDefault
      UIProgressView.alloc.initWithProgressViewStyle(style)
    end
    
    def self.create_ui_segmented_control(klass, options = {})
      items = options.delete(:items) || []
      UISegmentedControl.alloc.initWithItems(items)
    end
    
    def self.create_ui_table_view(klass, options = {})
      style = options.delete(:style) || UITableViewStylePlain
      UITableView.alloc.initWithFrame(CGRectZero, style: style)
    end
    
    def self.create_ui_table_view_cell(klass, options = {})
      style = options.delete(:style) || UITableViewCellStyleDefault
      UITableViewCell.alloc.initWithStyle(style, reuseIdentifier: options[:reuseIdentifier])
    end
  end
end