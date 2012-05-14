describe "UIViewExtensions" do
  before do
  end

  it "should get and set view name" do
    view = UIView.alloc.initWithFrame(CGRectZero)
    view.name = "view_name"
    view.name.should == "view_name"
  end
  
  describe "dimensions" do
    it "should set left" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.left = 10
      view.left.should == 10
    end
    
    it "should set right" do
      superview = UIView.alloc.initWithFrame(CGRectMake(0, 0, 100, 100))
      view = UIView.alloc.initWithFrame(CGRectZero)
      superview.addSubview(view)
      view.right = 10
      view.right.should == 10
    end
    
    it "should set top" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.top = 11
      view.top.should == 11
    end
    
    it "should set bottom" do
      superview = UIView.alloc.initWithFrame(CGRectMake(0, 0, 100, 100))
      view = UIView.alloc.initWithFrame(CGRectZero)
      superview.addSubview(view)
      view.bottom = 10
      view.bottom.should == 10
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
  
  describe "UIViewExtensions#find" do
    before do
      @parent_view = UIView.alloc.initWithFrame(CGRectZero)
      @child_view = UIView.alloc.initWithFrame(CGRectZero)
      @child_view.name = "nemo"
      @parent_view.addSubview(@child_view)
    end
    
    it "should find subview by name" do
      @parent_view.find("nemo").should == @child_view
    end
    
    it "should find subview by name using alias method" do
      @parent_view.subview("nemo").should == @child_view
    end
    
    it "should return nil if subview cannot be found" do
      @parent_view.find("nemo").should == @child_view
    end
  end
end
