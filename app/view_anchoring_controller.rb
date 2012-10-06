class ViewAnchoringController < UIViewController
  include SimpleView::Layout

  def viewDidLoad
    super

    SimpleView::Styles.define :square,
      width: 20,
      height: 20

    setup view, controller: self do
      controller.title = "View Anchoring"
      view.backgroundColor = UIColor.whiteColor

      rect name: 'fill', styles: :square, backgroundColor: "#000", anchors: [:all]

      rect name: 'tl', styles: :square, backgroundColor: "#990000", anchors: [:top, :left]
      rect name: 'tc', styles: :square, backgroundColor: "#993300", anchors: [:top]
      rect name: 'tr', styles: :square, backgroundColor: "#CC9900", anchors: [:top, :right]

      rect name: 'ml', styles: :square, backgroundColor: "#006600", anchors: [:left]
      rect name: 'mc', styles: :square, backgroundColor: "#336666", anchors: []
      rect name: 'mr', styles: :square, backgroundColor: "#0033FF", anchors: [:right]

      rect name: 'bl', styles: :square, backgroundColor: "#000099", anchors: [:bottom, :left]
      rect name: 'bc', styles: :square, backgroundColor: "#660099", anchors: [:bottom]
      rect name: 'br', styles: :square, backgroundColor: "#990066", anchors: [:bottom, :right]
    end
  end
end