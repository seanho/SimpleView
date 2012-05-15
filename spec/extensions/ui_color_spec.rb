describe "UIColor" do
  describe "#from_html" do
    it "should convert HTML hex color to UIColor" do
      color = UIColor.from_html("#f00")
      r = Pointer.new(:float)
      g = Pointer.new(:float)
      b = Pointer.new(:float)
      a = Pointer.new(:float)
      color.getRed(r, green: g, blue: b, alpha: a)
      r[0].should == 1
      g[0].should == 0
      b[0].should == 0
      a[0].should == 1
    end
  end
end