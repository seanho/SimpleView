describe "UIViewBuilder" do
  it "should build UIView" do
    UI::UIViewBuilder.new.build(UIView).class.should == UIView
  end
  
  it "should set backgroundColor by HTML code" do
    view = UI::UIViewBuilder.new.build(UIView, backgroundColor: "#f00")
    
    r = Pointer.new(:float)
    g = Pointer.new(:float)
    b = Pointer.new(:float)
    a = Pointer.new(:float)
    view.backgroundColor.getRed(r, green: g, blue: b, alpha: a)
    r[0].should == 1
    g[0].should == 0
    b[0].should == 0
    a[0].should == 1
  end
  
  it "should set background_color by HTML code" do
    view = UI::UIViewBuilder.new.build(UIView, background_color: "#f00")
    
    r = Pointer.new(:float)
    g = Pointer.new(:float)
    b = Pointer.new(:float)
    a = Pointer.new(:float)
    view.backgroundColor.getRed(r, green: g, blue: b, alpha: a)
    r[0].should == 1
    g[0].should == 0
    b[0].should == 0
    a[0].should == 1
  end
  
  describe "#font" do
    it "should set font by size" do
      view = UI::UIViewBuilder.new.build(UILabel, font: "13")
      puts view.font
      view.font.pointSize.should == 13
    end
    
    it "should set bold font by size" do
      view = UI::UIViewBuilder.new.build(UILabel, font: "bold 13")
      puts view.font
      view.font.pointSize.should == 13
      view.font.fontName.should.match /bold/i
    end
    
    it "should set italic font by size" do
      view = UI::UIViewBuilder.new.build(UILabel, font: "italic 13")
      puts view.font
      view.font.pointSize.should == 13
      view.font.fontName.should.match /oblique/i
    end
    
    it "should set font by size and name" do
      view = UI::UIViewBuilder.new.build(UILabel, font: "13 ArialMT")
      puts view.font
      view.font.pointSize.should == 13
      view.font.fontName.should == "ArialMT"
    end
  end
end