class UIView
  include SimpleView
  
  attr_accessor :name
  
  def find(name)
    subviews.each do |subview|
      return subview if subview.name == name
    end
  end
  alias_method :subview, :find
  
  def setup(&block)
    self.instance_eval &block
  end
end