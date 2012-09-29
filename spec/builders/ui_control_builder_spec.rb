describe "UIControlBuilder" do
  it "should build UIControl" do
    SimpleView::Builders::UIControlBuilder.new.build(UIControl).class.should == UIControl
  end
end