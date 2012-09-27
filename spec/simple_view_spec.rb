describe "UI" do
  describe "Layout" do
    it "should convert locals to instance variables" do
      view = UIView.alloc.init
      controller_a = Object.new
      controller_b = Object.new
      layout = Simple::Layouts.new(view, controller_a: controller_a, controller_b: controller_b)
      puts layout.view.class
      layout.view.should == view
      layout.controller_a.should == controller_a
      layout.controller_b.should == controller_b
    end

    describe "#setup" do
      it "should execute the block within view object scope" do
        view = UIView.alloc.initWithFrame(CGRectZero)
        Simple::Layouts.setup(view) do
          @view.frame = CGRectMake(0, 0, 10, 10)
        end
        view.frame.should == CGRectMake(0, 0, 10, 10)
      end
    end

    describe "#add" do
      it "should add view with options" do
        frame = CGRectMake(0, 0, 10, 10)
        alpha = 0.5
        backgroundColor = UIColor.redColor

        layout = Simple::Layouts.new
        view = layout.add UIView, frame: frame, alpha: alpha, backgroundColor: backgroundColor
        view.frame.should == frame
        view.alpha.should == alpha
        view.backgroundColor.should == backgroundColor
      end

      it "should execute block" do
        layout = Simple::Layouts.new
        view = layout.add UIView do
          label
        end
        view.subviews.first.class.should == UILabel
      end

      it "should add view to superview" do
        super_view = UIView.alloc.init
        layout = Simple::Layouts.new(super_view)
        subview = layout.add UIView
        super_view.subviews.first.should == subview
      end
    end

    describe "shorthand methods" do
      before do
        @layout = Simple::Layouts.new
      end

      it "should create UIButton" do
        @layout.button.class.should == UIRoundedRectButton
      end

      it "should create UIDatePicker" do
        @layout.date_picker.class.should == UIDatePicker
      end

      it "should create UIImageView" do
        @layout.image_view.class.should == UIImageView
      end

      it "should create UILabel" do
        @layout.label.class.should == UILabel
      end

      it "should create UIPageControl" do
        @layout.page_control.class.should == UIPageControl
      end

      it "should create UIPickerView" do
        @layout.picker_view.class.should == UIPickerView
      end

      it "should create UIProgressView" do
        @layout.progress_view.class.should == UIProgressView
      end

      it "should create UIScrollView" do
        @layout.scroll_view.class.should == UIScrollView
      end

      it "should create UISearchBar" do
        @layout.search_bar.class.should == UISearchBar
      end

      it "should create UISegmentedControl" do
        @layout.segmented_control.class.should == UISegmentedControl
      end

      it "should create UISlider" do
        @layout.slider.class.should == UISlider
      end

      it "should create UIStepper" do
        @layout.stepper.class.should == UIStepper
      end

      it "should create UISwitch" do
        @layout.switch.class.should == UISwitch
      end

      it "should create UITabBar" do
        @layout.tab_bar.class.should == UITabBar
      end

      it "should create UITableView" do
        @layout.table_view.class.should == UITableView
      end

      it "should create UITableViewCell" do
        @layout.table_view_cell.class.should == UITableViewCell
      end

      it "should create UITextField" do
        @layout.text_field.class.should == UITextField
      end

      it "should create UITextView" do
        @layout.text_view.class.should == UITextView
      end

      it "should create UIToolbar" do
        @layout.toolbar.class.should == UIToolbar
      end

      it "should create UIWebView" do
        @layout.web_view.class.should == UIWebView
      end
    end
  end
end