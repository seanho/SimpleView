describe "UILabelBuilder" do
  describe "#font" do
    it "should set font by size" do
      view = UI::UILabelBuilder.new.build(UILabel, font: "13")
      view.font.pointSize.should == 13
    end
    
    it "should set bold font by size" do
      view = UI::UILabelBuilder.new.build(UILabel, font: "bold 13")
      view.font.pointSize.should == 13
      view.font.fontName.should.match /bold/i
    end
    
    it "should set italic font by size" do
      view = UI::UILabelBuilder.new.build(UILabel, font: "italic 13")
      view.font.pointSize.should == 13
      view.font.fontName.should.match /oblique/i
    end
    
    it "should set font by size and name" do
      view = UI::UILabelBuilder.new.build(UILabel, font: "13 ArialMT")
      view.font.pointSize.should == 13
      view.font.fontName.should == "ArialMT"
    end
  end
end