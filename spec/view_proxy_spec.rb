describe "SimpleView::ViewProxy" do
  it "should convert locals to instance variables" do
    view = UIView.alloc.init
    local_a = Object.new
    local_b = Object.new

    proxy = SimpleView::ViewProxy.new(view, local_a: local_a, local_b: local_b)

    proxy.view.should == view
    proxy.local_a.should == local_a
    proxy.local_b.should == local_b
  end

  describe "#add" do
    it "should add view with options" do
      alpha = 0.5
      backgroundColor = UIColor.redColor

      proxy = SimpleView::ViewProxy.new
      view = proxy.add UIView, top: 0, left: 0, width: 10, height: 10, alpha: alpha, backgroundColor: backgroundColor
      view.frame.should == CGRectMake(0, 0, 10, 10)
      view.alpha.should == alpha
      view.backgroundColor.should == backgroundColor
    end

    describe "#add with predefined styles" do
      it "should add view with default style" do
        SimpleView::Styles.define UIView, backgroundColor: UIColor.redColor

        proxy = SimpleView::ViewProxy.new
        view = proxy.add UIView
        view.backgroundColor.should == UIColor.redColor
      end

      it "should add view with custom style" do
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor

        proxy = SimpleView::ViewProxy.new
        view = proxy.add UIView, styles: :blue
        view.backgroundColor.should == UIColor.blueColor
      end

      it "should add view with multiple custom styles" do
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor
        SimpleView::Styles.define :alpha, alpha: 0.5

        proxy = SimpleView::ViewProxy.new
        view = proxy.add UIView, styles: [:blue, :alpha]
        view.backgroundColor.should == UIColor.blueColor
        view.alpha.should == 0.5
      end

      it "should add view with custom style overriding default style" do
        SimpleView::Styles.define UIView, backgroundColor: UIColor.redColor
        SimpleView::Styles.define :blue, backgroundColor: UIColor.blueColor

        proxy = SimpleView::ViewProxy.new
        view = proxy.add UIView, styles: :blue
        view.backgroundColor.should == UIColor.blueColor
      end
    end

    it "should execute block" do
      proxy = SimpleView::ViewProxy.new
      view = proxy.add UIView do
        label
      end
      view.subviews.first.class.should == UILabel
    end

    it "should add view to superview" do
      super_view = UIView.alloc.init
      proxy = SimpleView::ViewProxy.new(super_view)
      subview = proxy.add UIView
      super_view.subviews.first.should == subview
    end
  end

  describe "shorthand methods" do
    before do
      @proxy = SimpleView::ViewProxy.new
    end

    it "should create UIActionSheet" do
      @proxy.action_sheet.class.should == UIActionSheet
    end

    it "should create UIActivityIndicatorView" do
      @proxy.activity_indicator_view.class.should == UIActivityIndicatorView
    end

    it "should create UIButton" do
      @proxy.button.class.should == UIRoundedRectButton
    end

    it "should create UIDatePicker" do
      @proxy.date_picker.class.should == UIDatePicker
    end

    it "should create UIImageView" do
      @proxy.image_view.class.should == UIImageView
    end

    it "should create UILabel" do
      @proxy.label.class.should == UILabel
    end

    it "should create UIPageControl" do
      @proxy.page_control.class.should == UIPageControl
    end

    it "should create UIPickerView" do
      @proxy.picker_view.class.should == UIPickerView
    end

    it "should create UIProgressView" do
      @proxy.progress_view.class.should == UIProgressView
    end

    it "should create UIScrollView" do
      @proxy.scroll_view.class.should == UIScrollView
    end

    it "should create UISearchBar" do
      @proxy.search_bar.class.should == UISearchBar
    end

    it "should create UISegmentedControl" do
      @proxy.segmented_control.class.should == UISegmentedControl
    end

    it "should create UISlider" do
      @proxy.slider.class.should == UISlider
    end

    it "should create UIStepper" do
      @proxy.stepper.class.should == UIStepper
    end

    it "should create UISwitch" do
      @proxy.switch.class.should == UISwitch
    end

    it "should create UITabBar" do
      @proxy.tab_bar.class.should == UITabBar
    end

    it "should create UITableView" do
      @proxy.table_view.class.should == UITableView
    end

    it "should create UITableViewCell" do
      @proxy.table_view_cell.class.should == UITableViewCell
    end

    it "should create UITextField" do
      @proxy.text_field.class.should == UITextField
    end

    it "should create UITextView" do
      @proxy.text_view.class.should == UITextView
    end

    it "should create UIToolbar" do
      @proxy.toolbar.class.should == UIToolbar
    end

    it "should create UIWebView" do
      @proxy.web_view.class.should == UIWebView
    end
  end
end