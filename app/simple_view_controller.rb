class SimpleViewController < UIViewController
  def viewDidLoad
    view.setup do
      label name: "label", frame: CGRectMake(0, 0, 100, 20), text: "haha"
    end
  end
end