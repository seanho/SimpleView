module SimpleView
  @@structs_map = {
    CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
    CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
    CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
    CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
    UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
    UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
  }

  def initialize_view(view, options = {})
    unless options.nil?
      options.each do |k,v|
        options[k] = @@structs_map[v.class].call(v) if @@structs_map.has_key?(v.class)
      end
      view.setValuesForKeysWithDictionary(options)
    end
    self.addSubview(view) if self.is_a?(UIView)
    view
  end

  def image_view(image = nil, highlighted_image = nil, options = {})
    if image && highlighted_image
      view = UIImageView.alloc.initWithImage(image, highlightedImage:highlighted_image)
    elsif image
      view = UIImageView.alloc.initWithImage(image)
    else
      view = UIImageView.alloc.initWithFrame(CGRectZero)
    end
    initialize_view(view, options)
  end
  
  def label(options = {})
    view = UILabel.alloc.initWithFrame(CGRectZero)
    initialize_view(view, options)
  end
  
  def button(button_type = UIButtonTypeRoundedRect, options = {})
    view = UIButton.buttonWithType(button_type)
    initialize_view(view, options)
  end
end