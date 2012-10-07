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

      rect name: 'fill', styles: :square, backgroundColor: "#000", top: 0, left: 0, bottom: 0, right: 0

      rect name: 'tl', styles: :square, backgroundColor: "#990000", top: 0, left: 0
      rect name: 'tc', styles: :square, backgroundColor: "#993300", top: 0
      rect name: 'tr', styles: :square, backgroundColor: "#CC9900", top: 0, right: 0

      rect name: 'ml', styles: :square, backgroundColor: "#006600", left: 0
      rect name: 'mc', styles: :square, backgroundColor: "#336666"
      rect name: 'mr', styles: :square, backgroundColor: "#0033FF", right: 0

      rect name: 'bl', styles: :square, backgroundColor: "#000099", bottom: 0, left: 0
      rect name: 'bc', styles: :square, backgroundColor: "#660099", bottom: 0
      rect name: 'br', styles: :square, backgroundColor: "#990066", bottom: 0, right: 0
    end
  end
end