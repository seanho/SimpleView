class SimpleViewController < UIViewController
  def viewDidLoad
    self.title = "SimpleView Demo"
    
    UI::Layouts.setup(view, controller: self) do
      rect width: 20, height: 20, backgroundColor: "#000", anchors: [:top, :left, :bottom, :right]
                        
      rect width: 20, height: 20, backgroundColor: "#990000", anchors: [:top, :left]
      rect width: 20, height: 20, backgroundColor: "#993300", anchors: [:top]
      rect width: 20, height: 20, backgroundColor: "#CC9900", anchors: [:top, :right]
      
      rect width: 20, height: 20, backgroundColor: "#006600", anchors: [:left]
      rect width: 20, height: 20, backgroundColor: "#336666", anchors: []
      rect width: 20, height: 20, backgroundColor: "#0033FF", anchors: [:right]
      
      rect width: 20, height: 20, backgroundColor: "#000099", anchors: [:bottom, :left]
      rect width: 20, height: 20, backgroundColor: "#660099", anchors: [:bottom]
      rect width: 20, height: 20, backgroundColor: "#990066", anchors: [:bottom, :right]
    end
  end
end