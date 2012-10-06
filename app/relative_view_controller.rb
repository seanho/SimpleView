class RelativeViewController < UIViewController
  include SimpleView::Layout

  def viewDidLoad
    super

    SimpleView::Styles.define :square,
      width: 20,
      height: 20

    setup view, controller: self do
      controller.title = "Relative Views"
      view.backgroundColor = UIColor.whiteColor

      rect name: 'center', styles: :square, backgroundColor: "#000", anchors: []
      rect styles: :square, backgroundColor: "#E2DF9A", anchors: [], bottom: 20, top_of: 'center'
      rect styles: :square, backgroundColor: "#EBE54D", anchors: [], left: 20, right_to: 'center'
      rect styles: :square, backgroundColor: "#757449", anchors: [], top: 20, bottom_of: 'center'
      rect styles: :square, backgroundColor: "#4B490B", anchors: [], right: 20, left_to: 'center'

      rect name: 'top_left', styles: :square, backgroundColor: "#000", anchors: [:top, :left]
      rect styles: :square, backgroundColor: "#9E1E4C", anchors: [:top], left: 20, right_to: 'top_left'
      rect styles: :square, backgroundColor: "#FF1168", anchors: [:left], top: 20, bottom_of: 'top_left'

      rect name: 'top_right', styles: :square, backgroundColor: "#000", anchors: [:top, :right]
      rect styles: :square, backgroundColor: "#9E1E4C", anchors: [:top], right: 20, left_to: 'top_right'
      rect styles: :square, backgroundColor: "#FF1168", anchors: [:right], top: 20, bottom_of: 'top_right'

      rect name: 'bottom_left', styles: :square, backgroundColor: "#000", anchors: [:bottom, :left]
      rect styles: :square, backgroundColor: "#9E1E4C", anchors: [:bottom], left: 20, right_to: 'bottom_left'
      rect styles: :square, backgroundColor: "#FF1168", anchors: [:left], bottom: 20, top_of: 'bottom_left'

      rect name: 'bottom_right', styles: :square, backgroundColor: "#000", anchors: [:bottom, :right]
      rect styles: :square, backgroundColor: "#9E1E4C", anchors: [:bottom], right: 20, left_to: 'bottom_right'
      rect styles: :square, backgroundColor: "#FF1168", anchors: [:right], bottom: 20, top_of: 'bottom_right'

      label name: 'label1', text: 'Test', anchors: [:top]
      label text: 'HiHi', anchors: [:top], right_to: 'label1'
    end
  end
end