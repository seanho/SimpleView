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

      rect name: 'center', styles: :square, backgroundColor: "#000"
      rect styles: :square, backgroundColor: "#E2DF9A", bottom: 20, bottom_is: 'center'
      rect styles: :square, backgroundColor: "#EBE54D", left: 20, left_is: 'center'
      rect styles: :square, backgroundColor: "#757449", top: 20, top_is: 'center'
      rect styles: :square, backgroundColor: "#4B490B", right: 20, right_is: 'center'

      rect name: 'top_left', styles: :square, backgroundColor: "#000", top: 0, left: 0
      rect styles: :square, backgroundColor: "#9E1E4C", top: 0, left: 20, left_is: 'top_left'
      rect styles: :square, backgroundColor: "#FF1168", top: 20, left: 0, top_is: 'top_left'

      rect name: 'top_right', styles: :square, backgroundColor: "#000", top: 0, right: 0
      rect styles: :square, backgroundColor: "#9E1E4C", top: 0, right: 20, right_is: 'top_right'
      rect styles: :square, backgroundColor: "#FF1168", top: 20, right: 0, top_is: 'top_right'

      rect name: 'bottom_left', styles: :square, backgroundColor: "#000", bottom: 0, left: 0
      rect styles: :square, backgroundColor: "#9E1E4C", bottom: 0, left: 20, left_is: 'bottom_left'
      rect styles: :square, backgroundColor: "#FF1168", bottom: 20, left: 0, bottom_is: 'bottom_left'

      rect name: 'bottom_right', styles: :square, backgroundColor: "#000", bottom: 0, right: 0
      rect styles: :square, backgroundColor: "#9E1E4C", bottom: 0, right: 20, right_is: 'bottom_right'
      rect styles: :square, backgroundColor: "#FF1168", bottom: 20, right: 0, bottom_is: 'bottom_right'
    end
  end
end