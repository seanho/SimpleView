describe "SimpleView::ViewBuilder" do
  describe "UIViewBuilder" do
    it "should build UIView" do
      SimpleView::ViewBuilder.view_for(UIView).class.should == UIView
    end

    describe "#backgroundColor" do
      it "should set backgroundColor by HTML code" do
        view = SimpleView::ViewBuilder.view_for(UIView, backgroundColor: "#f00")

        r = Pointer.new(:float)
        g = Pointer.new(:float)
        b = Pointer.new(:float)
        a = Pointer.new(:float)
        view.backgroundColor.getRed(r, green: g, blue: b, alpha: a)
        r[0].should == 1
        g[0].should == 0
        b[0].should == 0
        a[0].should == 1
      end

      it "should set background_color by HTML code" do
        view = SimpleView::ViewBuilder.view_for(UIView, background_color: "#f00")

        r = Pointer.new(:float)
        g = Pointer.new(:float)
        b = Pointer.new(:float)
        a = Pointer.new(:float)
        view.backgroundColor.getRed(r, green: g, blue: b, alpha: a)
        r[0].should == 1
        g[0].should == 0
        b[0].should == 0
        a[0].should == 1
      end
    end
  end

  describe "UIActionSheet" do
    it "should build UIActionSheet" do
      view = SimpleView::ViewBuilder.view_for(UIActionSheet)
      view.class.should == UIActionSheet
    end

    it "should build UIActionSheet with title" do
      view = SimpleView::ViewBuilder.view_for(UIActionSheet, title: 'title')
      view.class.should == UIActionSheet
      view.title.should == 'title'
    end

    it "should build UIActionSheet with delegate" do
      delegate = Object.new
      view = SimpleView::ViewBuilder.view_for(UIActionSheet, delegate: delegate)
      view.class.should == UIActionSheet
      view.delegate.should == delegate
    end

    it "should build UIActionSheet with cancel title" do
      view = SimpleView::ViewBuilder.view_for(UIActionSheet, cancel_button_title: 'cancel')
      view.class.should == UIActionSheet
      view.buttonTitleAtIndex(view.cancelButtonIndex).should == 'cancel'
    end

    it "should build UIActionSheet with destructive title" do
      view = SimpleView::ViewBuilder.view_for(UIActionSheet, destructive_button_title: 'destroy')
      view.class.should == UIActionSheet
      view.buttonTitleAtIndex(view.destructiveButtonIndex).should == 'destroy'
    end

    it "should build UIActionSheet with other title" do
      view = SimpleView::ViewBuilder.view_for(UIActionSheet, other_button_titles: 'others')
      view.class.should == UIActionSheet
      view.buttonTitleAtIndex(view.firstOtherButtonIndex).should == 'others'
    end
  end

  describe "UIActivityIndicatorView" do
    it "should build UIActivityIndicatorView" do
      view = SimpleView::ViewBuilder.view_for(UIActivityIndicatorView)
      view.class.should == UIActivityIndicatorView
      view.activityIndicatorViewStyle.should == UIActivityIndicatorViewStyleWhite
    end

    it "should build UIActivityIndicatorView with style" do
      view = SimpleView::ViewBuilder.view_for(UIActivityIndicatorView, style: UIActivityIndicatorViewStyleGray)
      view.activityIndicatorViewStyle.should == UIActivityIndicatorViewStyleGray
    end
  end

  describe "UIButtonBuilder" do
    it "should build UIButton" do
      button = SimpleView::ViewBuilder.view_for(UIButton)
      button.class.should == UIRoundedRectButton
      button.buttonType.should == UIButtonTypeRoundedRect
    end

    it "should build UIButton with buttonType" do
      button = SimpleView::ViewBuilder.view_for(UIButton, buttonType: UIButtonTypeDetailDisclosure)
      button.buttonType.should == UIButtonTypeDetailDisclosure
    end
  end

  describe "UIControlBuilder" do
    it "should build UIControl" do
      SimpleView::ViewBuilder.view_for(UIControl).class.should == UIControl
    end
  end

  describe "UIImageViewBuilder" do
    it "should build UIImageView" do
      image_view = SimpleView::ViewBuilder.view_for(UIImageView)
      image_view.class.should == UIImageView
    end

    it "should build UIImageView with image" do
      image = UIImage.imageNamed "test.jpg"
      image_view = SimpleView::ViewBuilder.view_for(UIImageView, image: image)
      image_view.image.should == image
    end

    it "should build UIImageView with image string" do
      image_view = SimpleView::ViewBuilder.view_for(UIImageView, image: "test.jpg")
      image_view.image.class.should == UIImage
    end

    it "should build UIImageView with image and highlightedImage" do
      image = UIImage.imageNamed "test.jpg"
      highlighted = UIImage.imageNamed "test.jpg"
      image_view = SimpleView::ViewBuilder.view_for(UIImageView, image: image, highlightedImage: highlighted)
      image_view.image.should == image
      image_view.highlightedImage.should == highlighted
    end

    it "should build UIImageView with image string and highlightedImage string" do
      image_view = SimpleView::ViewBuilder.view_for(UIImageView, image: "test.jpg", highlightedImage: "test.jpg")
      image_view.image.class.should == UIImage
      image_view.highlightedImage.class.should == UIImage
    end
  end

  describe "UIProgressViewBuilder" do
    it "should build UIProgressView" do
      view = SimpleView::ViewBuilder.view_for(UIProgressView)
      view.class.should == UIProgressView
      view.progressViewStyle.should == UIProgressViewStyleDefault
    end

    it "should build UIProgressView with style" do
      view = SimpleView::ViewBuilder.view_for(UIProgressView, style: UIProgressViewStyleBar)
      view.progressViewStyle.should == UIProgressViewStyleBar
    end
  end

  describe "UISegmentedControlBuilder" do
    it "should build UISegmentedControl" do
      view = SimpleView::ViewBuilder.view_for(UISegmentedControl)
      view.class.should == UISegmentedControl
      view.numberOfSegments.should == 0
    end

    it "should build UISegmentedControl with items" do
      items = ["ABC"]
      view = SimpleView::ViewBuilder.view_for(UISegmentedControl, items: items)
      view.numberOfSegments.should == 1
    end
  end

  describe "UITableViewBuilder" do
    it "should build UITableView" do
      view = SimpleView::ViewBuilder.view_for(UITableView)
      view.class.should == UITableView
      view.style.should == UITableViewStylePlain
    end

    it "should build UITableView with style" do
      view = SimpleView::ViewBuilder.view_for(UITableView, style: UITableViewStyleGrouped)
      view.style.should == UITableViewStyleGrouped
    end
  end

  describe "UITableViewCellBuilder" do
    it "should build UITableViewCell" do
      view = SimpleView::ViewBuilder.view_for(UITableViewCell)
      view.class.should == UITableViewCell
      view.style.should == UITableViewCellStyleDefault
    end

    it "should build UITableViewCell with style" do
      view = SimpleView::ViewBuilder.view_for(UITableViewCell, style: UITableViewCellStyleSubtitle)
      view.style.should == UITableViewCellStyleSubtitle
    end

    it "should build UITableViewCell with style and reuseIdentifier" do
      view = SimpleView::ViewBuilder.view_for(UITableViewCell, reuseIdentifier: "CellIdentifier")
      view.reuseIdentifier.should == "CellIdentifier"
    end
  end
end