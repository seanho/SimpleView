describe "UIFontExtensions" do
  describe "#parse" do
    it "should return font by size" do
      font = UIFont.parse("13")
      font.pointSize.should == 13
    end

    it "should return bold font by size" do
      font = UIFont.parse("bold 13")
      font.pointSize.should == 13
      font.fontName.should.match /bold/i
    end

    it "should return italic font by size" do
      font = UIFont.parse("italic 13")
      font.pointSize.should == 13
      font.fontName.should.match /oblique/i
    end

    it "should return font by size and name" do
      font = UIFont.parse("13 ArialMT")
      font.pointSize.should == 13
      font.fontName.should == "ArialMT"
    end
  end
end