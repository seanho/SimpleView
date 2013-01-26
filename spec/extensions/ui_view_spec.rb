describe "SimpleView::UIViewExtensions" do
  describe "name accessor" do
    it "should get and set view name" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.name = "view_name"
      view.name.should == "view_name"
    end
  end

  describe "dimensions" do
    it "should set left" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.left = 10
      view.left.should == 10
    end

    it "should set top" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.top = 11
      view.top.should == 11
    end

    it "should set width" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.width = 12
      view.width.should == 12
    end

    it "should set height" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.height = 13
      view.height.should == 13
    end
  end

  describe "#find" do
    before do
      @parent = UIView.alloc.initWithFrame(CGRectZero)
      @child = UIView.alloc.initWithFrame(CGRectZero)
      @child.name = "nemo"
      @parent.addSubview(@child)
    end

    it "should find subview by name" do
      @parent.find("nemo").should == @child
    end

    it "should find subview by name using alias method" do
      @parent.subview("nemo").should == @child
    end

    it "should return nil if subview cannot be found" do
      @parent.find("nemo").should == @child
    end
  end

  describe "#sibling" do
    before do
      @parent = UIView.alloc.initWithFrame(CGRectZero)
      @child = UIView.alloc.initWithFrame(CGRectZero)
      @child.name = 'me'
      @sibling = UIView.alloc.initWithFrame(CGRectZero)
      @sibling.name = 'sib'
      @parent.addSubview @child
      @parent.addSubview @sibling
    end

    it "should find sibling by name" do
      @child.sibling('sib').should == @sibling
    end
  end

  describe "#closest" do
    before do
      @grand_parent = UIView.alloc.initWithFrame(CGRectZero)
      @parent = UIView.alloc.initWithFrame(CGRectZero)
      @child = UIView.alloc.initWithFrame(CGRectZero)
      @child.name = 'me'
      @closest = UIView.alloc.initWithFrame(CGRectZero)
      @closest.name = 'mom'
      @parent.addSubview @child
      @grand_parent.addSubview @parent
    end

    it "should find view by name which is 1 level up" do
      @parent.addSubview @closest
      @child.closest('mom').should == @closest
    end

    it "should find view by name which is 2 levels up" do
      @grand_parent.addSubview @closest
      @child.closest('mom').should == @closest
    end
  end
end
