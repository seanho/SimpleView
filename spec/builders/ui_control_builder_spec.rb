describe "UIControlBuilder" do
  it "should build UIControl" do
    Simple::UIControlBuilder.new.build(UIControl).class.should == UIControl
  end
end