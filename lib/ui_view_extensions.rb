class UIView
  include SimpleView
  
  attr_accessor :name
  #attr_reader :left, :top, :width, :height
  
  def find(name)
    subviews.each do |subview|
      return subview if subview.name == name
    end
  end
  alias_method :subview, :find
  
  def setup(&block)
    self.instance_eval &block
  end
  
  def left
    self.frame.origin.x
  end

  def setLeft(value)
    f = self.frame
    f.origin.x = value
    self.frame = f
  end
  
  def top
    self.frame.origin.y
  end
  
  def setTop(value)
    f = self.frame
    f.origin.y = value
    self.frame = f
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