describe "SimpleView::Layout" do
  describe "#setup" do
    class DummyController
      include SimpleView::Layout
    end

    it "should execute the block within view's scope" do
      view = UIView.alloc.initWithFrame(CGRectZero)
      DummyController.new.setup view do
        view.frame = CGRectMake(0, 0, 10, 10)
      end
      view.frame.should == CGRectMake(0, 0, 10, 10)
    end
  end
end