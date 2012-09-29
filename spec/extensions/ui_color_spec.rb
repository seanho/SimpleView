describe "SimpleView::UIColor" do
  describe "#to_color" do
    it "should return self" do
      color = UIColor.redColor
      color.to_color.should == color
    end
  end
end