describe "SimpleView::UIFontExtensions" do
  describe "#to_font" do
    it "should return self" do
      font = UIFont.systemFontOfSize(13)
      font.to_font.should == font
    end
  end
end