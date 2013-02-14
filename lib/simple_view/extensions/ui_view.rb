class UIView
  def name
    self.accessibilityLabel
  end

  def name= name
    self.accessibilityLabel = name
  end

  def setName name
    self.name = name
  end

  def find name
    subviews.each do |subview|
      return subview if subview.name == name
    end
    nil
  end
  alias_method :subview, :find

  def sibling name
    if superview
      superview.find name
    else
      nil
    end
  end

  def closest name
    view = sibling name
    if view.nil? && superview
      view = superview.closest name
    end
    view
  end

  def left
    self.frame.origin.x
  end

  def setLeft value
    self.frame = [[value, self.frame.origin.y], [self.frame.size.width, self.frame.size.height]]
  end

  def top
    self.frame.origin.y
  end

  def setTop value
    self.frame = [[self.frame.origin.x, value], [self.frame.size.width, self.frame.size.height]]
  end

  def width
    self.frame.size.width
  end

  def setWidth value
    self.frame = [[self.frame.origin.x, self.frame.origin.y], [value, self.frame.size.height]]
  end

  def height
    self.frame.size.height
  end

  def setHeight value
    self.frame = [[self.frame.origin.x, self.frame.origin.y], [self.frame.size.width, value]]
  end
end