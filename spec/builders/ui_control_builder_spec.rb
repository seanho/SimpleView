describe "UIControlBuilder" do
  it "should build UIControl" do
    UI::UIControlBuilder.new.build(UIControl).class.should == UIControl
  end
end