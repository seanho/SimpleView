describe "UIViewExtensions" do
  before do
  end

  it "should get and set view name" do
    view = UIView.alloc.initWithFrame(CGRectZero)
    view.name = "view_name"
    view.name.should == "view_name"
  end
  
  describe "#find" do
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
  
  describe "#setup" do
    it "should execute the block within view object scope" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      view.setup do
        self.frame = CGRectMake(0, 0, 10, 10)
      end
      view.frame.should == CGRectMake(0, 0, 10, 10)
    end
  end
end
