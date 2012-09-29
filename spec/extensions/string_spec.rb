describe "SimpleView::String" do
  describe "#to_color" do
    it "should convert string to UIColor" do
      "#f00".to_color.should == UIColor.redColor
    end
  end
end