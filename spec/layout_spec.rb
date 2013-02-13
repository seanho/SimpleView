
describe "SimpleView::Layout" do
  class DummyController
    include SimpleView::Layout
  end

  describe "#setup" do
    it "should execute the block within view's scope" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      DummyController.new.setup view do
        view.frame = CGRectMake(0, 0, 10, 10)
      end
      view.frame.should == CGRectMake(0, 0, 10, 10)
    end
  end

  describe "#add" do
    before do
      @controller = DummyController.new
    end

    it "should add view with options" do
      alpha = 0.5
      backgroundColor = UIColor.redColor

      view = @controller.add_view UIView, top: 0, left: 0, width: 10, height: 10, alpha: alpha, backgroundColor: backgroundColor
      view.frame.should == CGRectMake(0, 0, 10, 10)
      view.alpha.should == alpha
      view.backgroundColor.should == backgroundColor
    end

    describe "#add with predefined styles" do
      it "should add view with default style" do
        SimpleView::Styles.define UIView, backgroundColor: UIColor.redColor

        view = @controller.add_view UIView
        view.backgroundColor.should == UIColor.redColor
      end

      it "should add view with custom style" do
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor

        view = @controller.add_view UIView, styles: :blue
        view.backgroundColor.should == UIColor.blueColor
      end

      it "should add view with multiple custom styles" do
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor
        SimpleView::Styles.define :alpha, alpha: 0.5

        view = @controller.add_view UIView, styles: [:blue, :alpha]
        view.backgroundColor.should == UIColor.blueColor
        view.alpha.should == 0.5
      end

      it "should add view with custom style overriding default style" do
        SimpleView::Styles.define UIView, backgroundColor: UIColor.redColor
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor

        view = @controller.add_view UIView, styles: :blue
        view.backgroundColor.should == UIColor.blueColor
      end
    end

    it "should add view to superview" do
      super_view = UIView.alloc.init

      @controller.setup super_view do
        @controller.add_view UIView
      end

      super_view.subviews.first.class.should == UIView
    end
  end

  describe "shorthand methods" do
    before do
      @controller = DummyController.new
    end

    it "should create UIActionSheet" do
      @controller.action_sheet.class.should == UIActionSheet
    end

    it "should create UIActivityIndicatorView" do
      @controller.activity_indicator_view.class.should == UIActivityIndicatorView
    end

    it "should create UIButton" do
      @controller.button.class.should == UIRoundedRectButton
    end

    it "should create UIDatePicker" do
      @controller.date_picker.class.should == UIDatePicker
    end

    it "should create UIImageView" do
      @controller.image_view.class.should == UIImageView
    end

    it "should create UILabel" do
      @controller.label.class.should == UILabel
    end

    it "should create UIPageControl" do
      @controller.page_control.class.should == UIPageControl
    end

    it "should create UIPickerView" do
      @controller.picker_view.class.should == UIPickerView
    end

    it "should create UIProgressView" do
      @controller.progress_view.class.should == UIProgressView
    end

    it "should create UIScrollView" do
      @controller.scroll_view.class.should == UIScrollView
    end

    it "should create UISearchBar" do
      @controller.search_bar.class.should == UISearchBar
    end

    it "should create UISegmentedControl" do
      @controller.segmented_control.class.should == UISegmentedControl
    end

    it "should create UISlider" do
      @controller.slider.class.should == UISlider
    end

    it "should create UIStepper" do
      @controller.stepper.class.should == UIStepper
    end

    it "should create UISwitch" do
      @controller.switch.class.should == UISwitch
    end

    it "should create UITabBar" do
      @controller.tab_bar.class.should == UITabBar
    end

    it "should create UITableView" do
      @controller.table_view.class.should == UITableView
    end

    it "should create UITableViewCell" do
      @controller.table_view_cell.class.should == UITableViewCell
    end

    it "should create UITextField" do
      @controller.text_field.class.should == UITextField
    end

    it "should create UITextView" do
      @controller.text_view.class.should == UITextView
    end

    it "should create UIToolbar" do
      @controller.toolbar.class.should == UIToolbar
    end

    it "should create UIWebView" do
      @controller.web_view.class.should == UIWebView
    end
  end
end