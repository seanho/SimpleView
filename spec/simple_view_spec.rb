describe "UI" do
  describe "Layout" do
    it "should convert locals to instance variables" do
      view = UIView.alloc.init
      controller_a = Object.new
      controller_b = Object.new
      layout = UI::Layout.new(view, controller_a: controller_a, controller_b: controller_b)
      layout.view.should == view
      layout.controller_a.should == controller_a
      layout.controller_b.should == controller_b
    end
    
    describe "#setup" do
      it "should execute the block within view object scope" do
        view = UIView.alloc.initWithFrame(CGRectZero)
        UI::Layout.setup(view) do
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
        
        layout = UI::Layout.new
        view = layout.add UIView, frame: frame, alpha: alpha, backgroundColor: backgroundColor
        view.frame.should == frame
        view.alpha.should == alpha
        view.backgroundColor.should == backgroundColor
      end
      
      it "should execute block" do
        layout = UI::Layout.new
        view = layout.add UIView do
          label
        end
        view.subviews.first.class.should == UILabel
      end
      
      it "should add view to superview" do
        super_view = UIView.alloc.init
        layout = UI::Layout.new(super_view)
        subview = layout.add UIView
        super_view.subviews.first.should == subview
      end
    end
    
    describe "shorthand methods" do
      before do
        @layout = UI::Layout.new
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
  
  describe "ViewBuilder" do
    it "should build UIView" do
      UI::ViewBuilder.build(UIView).class.should == UIView
    end
    
    it "should build UIControl" do
      UI::ViewBuilder.build(UIControl).class.should == UIControl
    end
    
    describe "UIButton" do
      it "should build UIButton" do
        button = UI::ViewBuilder.build(UIButton)
        button.class.should == UIRoundedRectButton
        button.buttonType.should == UIButtonTypeRoundedRect
      end

      it "should build UIButton with buttonType" do
        button = UI::ViewBuilder.build(UIButton, buttonType: UIButtonTypeDetailDisclosure)
        button.buttonType.should == UIButtonTypeDetailDisclosure
      end
    end
   
    describe "UIImageView" do
      it "should build UIImageView" do
        image_view = UI::ViewBuilder.build(UIImageView)
        image_view.class.should == UIImageView
      end

      it "should build UIImageView with image" do
        image = UIImage.imageNamed "cat"
        image_view = UI::ViewBuilder.build(UIImageView, image: image)
        image_view.image.should == image
      end

      it "should build UIImageView with image and highlightedImage" do
        image = UIImage.imageNamed "cat"
        highlighted = UIImage.imageNamed "nyan"
        image_view = UI::ViewBuilder.build(UIImageView, image: image, highlightedImage: highlighted)
        image_view.image.should == image
        image_view.highlightedImage.should == highlighted
      end
    end
    
    describe "UIProgressView" do
      it "should build UIProgressView" do
        view = UI::ViewBuilder.build(UIProgressView)
        view.class.should == UIProgressView
        view.progressViewStyle.should == UIProgressViewStyleDefault
      end

      it "should build UIProgressView with style" do
        view = UI::ViewBuilder.build(UIProgressView, style: UIProgressViewStyleBar)
        view.progressViewStyle.should == UIProgressViewStyleBar
      end
    end
    
    describe "UISegmentedControl" do
      it "should build UISegmentedControl" do
        view = UI::ViewBuilder.build(UISegmentedControl)
        view.class.should == UISegmentedControl
        view.numberOfSegments.should == 0
      end

      it "should build UISegmentedControl with items" do
        items = ["ABC"]
        view = UI::ViewBuilder.build(UISegmentedControl, items: items)
        view.numberOfSegments.should == 1
      end
    end
    
    describe "UITableView" do
      it "should build UITableView" do
        view = UI::ViewBuilder.build(UITableView)
        view.class.should == UITableView
        view.style.should == UITableViewStylePlain
      end

      it "should build UITableView with style" do
        view = UI::ViewBuilder.build(UITableView, style: UITableViewStyleGrouped)
        view.style.should == UITableViewStyleGrouped
      end
    end
    
    describe "UITableViewCell" do
      it "should build UITableViewCell" do
        view = UI::ViewBuilder.build(UITableViewCell)
        view.class.should == UITableViewCell
        view.style.should == UITableViewCellStyleDefault
      end

      it "should build UITableViewCell with style" do
        view = UI::ViewBuilder.build(UITableViewCell, style: UITableViewCellStyleSubtitle)
        view.style.should == UITableViewCellStyleSubtitle
      end
      
      it "should build UITableViewCell with style" do
        view = UI::ViewBuilder.build(UITableViewCell, reuseIdentifier: "CellIdentifier")
        view.reuseIdentifier.should == "CellIdentifier"
      end
    end
  end
end