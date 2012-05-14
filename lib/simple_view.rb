module SimpleView
  @@structs_map = {
    CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
    CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
    CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
    CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
    UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
    UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
  }

  def initialize_view(view, options = {}, &block)
    unless options.nil?
      options.each do |k,v|
        options[k] = @@structs_map[v.class].call(v) if @@structs_map.has_key?(v.class)
      end
      view.setValuesForKeysWithDictionary(options)
    end
    if block_given?
      block.call(view)
    end
    self.addSubview(view) if self.is_a?(UIView)
    view
  end
  private :initialize_view
  
  def create_view(klass, options = {}, &block)
    view = klass.alloc.initWithFrame(CGRectZero)
    initialize_view(view, options, &block)
  end

  def button(button_type = UIButtonTypeRoundedRect, options = {}, &block)
    view = UIButton.buttonWithType(button_type)
    initialize_view(view, options, &block)
  end

  def date_picker(options = {}, &block)
    create_view(UIDatePicker, options, &block)
  end

  def image_view(image = nil, highlighted_image = nil, options = {}, &block)
    if image && highlighted_image
      view = UIImageView.alloc.initWithImage(image, highlightedImage:highlighted_image)
    elsif image
      view = UIImageView.alloc.initWithImage(image)
    else
      view = UIImageView.alloc.initWithFrame(CGRectZero)
    end
    initialize_view(view, options, &block)
  end
  
  def label(options = {}, &block)
    create_view(UILabel, options, &block)
  end

  def page_control(options = {}, &block)
    create_view(UIPageControl, options, &block)
  end
  
  def picker_view(options = {}, &block)
    create_view(UIPickerView, options, &block)
  end
  
  def progress_view(style = UIProgressViewStyleDefault, options = {}, &block)
    view = UIProgressView.alloc.initWithProgressViewStyle(style)
    initialize_view(view, options, &block)
  end
  
  def activity_view(style = UIActivityIndicatorViewStyleWhiteLarge, options = {}, &block)
    view = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(style)
    initialize_view(view, options, &block)
  end

  def scroll_view(options = {}, &block)
    create_view(UIScrollView, options, &block)
  end
  
  def search_bar(options = {}, &block)
    create_view(UISearchBar, options, &block)
  end
  
  def segmented_control(items = [], options = {}, &block)
    view = UISegmentedControl.alloc.initWithItems(items)
    initialize_view(view, options, &block)
  end
  
  def slider(options = {}, &block)
    view = UISlider.alloc.init
    initialize_view(view, options, &block)
  end
  
  def stepper(options = {}, &block)
    view = UIStepper.alloc.init
    initialize_view(view, options, &block)
  end
  
  def switch(options = {}, &block)
    view = UISwitch.alloc.init
    initialize_view(view, options, &block)
  end
  
  def tab_bar(options = {}, &block)
    create_view(UITabBar, options, &block)
  end
  
  def table_view(style = UITableViewStylePlain, options = {}, &block)
    view = UITableView.alloc.initWithFrame(CGRectZero, style: style)
    initialize_view(view, options, &block)
  end
  
  def table_view_cell(style = UITableViewCellStyleDefault, reuseIdentifier = nil, options = {}, &block)
    view = UITableViewCell.alloc.initWithStyle(style, reuseIdentifier: reuseIdentifier)
    initialize_view(view, options, &block)
  end
  
  def text_field(options = {}, &block)
    view = UITextField.alloc.init
    initialize_view(view, options, &block)
  end
  
  def text_view(options = {}, &block)
    create_view(UITextView, options, &block)
  end
  
  def toolbar(options = {}, &block)
    view = UIToolbar.alloc.init
    initialize_view(view, options, &block)
  end
  
  def web_view(options = {}, &block)
    create_view(UIWebView, options, &block)
  end
end