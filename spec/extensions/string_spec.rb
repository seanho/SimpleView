describe "SimpleView::String" do
  describe "#to_color" do
    it "should return color by hex code" do
      "#f00".to_color.should == UIColor.redColor
    end
  end

  describe "#to_font" do
    it "should return font by size" do
      font = "13".to_font
      font.to_font.pointSize.should == 13
    end

    it "should return bold font by size" do
      font = "bold 13".to_font
      font.pointSize.should == 13
      font.fontName.should.match /bold/i
    end

    it "should return italic font by size" do
      font = "italic 13".to_font
      font.pointSize.should == 13
      font.fontName.should.match /oblique/i
    end

    it "should return font by size and name" do
      font = "13 ArialMT".to_font
      font.pointSize.should == 13
      font.fontName.should == "ArialMT"
    end
  end
end