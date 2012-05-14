class UIView
  attr_accessor :name

  def find(name)
    subviews.each do |subview|
      return subview if subview.name == name
    end
  end
  alias_method :subview, :find
  
  def left
    self.frame.origin.x
  end

  def setLeft(value)
    f = self.frame
    f.origin.x = value
    self.frame = f
  end
  
  def right
    if self.superview
      self.superview.width - (self.left + self.width)
    end
  end
  
  def setRight(value)
    if self.superview
      f = self.frame
      f.size.width = self.superview.width - value - f.origin.x
      self.frame = f
    end
  end
  
  def top
    self.frame.origin.y
  end
  
  def setTop(value)
    f = self.frame
    f.origin.y = value
    self.frame = f
  end
  
  def bottom
    if self.superview
      self.superview.height - (self.top + self.height)
    end
  end
  
  def setBottom(value)
    if self.superview
      f = self.frame
      f.size.height = self.superview.height - value - f.origin.y
      self.frame = f
    end
  end
  
  def width
    self.frame.size.width
  end
  
  def setWidth(value)
    f = self.frame
    f.size.width = value
    self.frame = f
  end
  
  def height
    self.frame.size.height
  end
  
  def setHeight(value)
    f = self.frame
    f.size.height = value
    self.frame = f
  end
end