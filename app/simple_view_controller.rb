class SimpleViewController < UIViewController
  include SimpleView::Layout

  def viewDidLoad
    SimpleView::Styles.define :square,
      width: 20,
      height: 20

    setup view, controller: self do
      controller.title = "SimpleView Demo"

      rect styles: :square, backgroundColor: "#000", anchors: [:top, :left, :bottom, :right]

      rect styles: :square, backgroundColor: "#990000", anchors: [:top, :left]
      rect styles: :square, backgroundColor: "#993300", anchors: [:top]
      rect styles: :square, backgroundColor: "#CC9900", anchors: [:top, :right]

      rect styles: :square, backgroundColor: "#006600", anchors: [:left]
      rect styles: :square, backgroundColor: "#336666", anchors: []
      rect styles: :square, backgroundColor: "#0033FF", anchors: [:right]

      rect styles: :square, backgroundColor: "#000099", anchors: [:bottom, :left]
      rect styles: :square, backgroundColor: "#660099", anchors: [:bottom]
      rect styles: :square, backgroundColor: "#990066", anchors: [:bottom, :right]
    end
  end
end