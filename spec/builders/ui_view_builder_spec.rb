describe "UIViewBuilder" do
  it "should build UIView" do
    UI::UIViewBuilder.new.build(UIView).class.should == UIView
  end
end