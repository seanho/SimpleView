describe "UIViewBuilder" do
  it "should build UIView" do
    UI::UIViewBuilder.new.build(UIView).class.should == UIView
  end
  
  describe "#backgroundColor" do
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
  end
  
  describe "#tintColor" do
    it "should set tintColor" do
      view = UI::UIViewBuilder.new.build(UIToolbar, tintColor: "#f00")
    end
  end
end