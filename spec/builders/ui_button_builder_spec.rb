describe "UIButtonBuilder" do
  it "should build UIButton" do
    button = UI::UIButtonBuilder.new.build(UIButton)
    button.class.should == UIRoundedRectButton
    button.buttonType.should == UIButtonTypeRoundedRect
  end

  it "should build UIButton with buttonType" do
    button = UI::UIButtonBuilder.new.build(UIButton, buttonType: UIButtonTypeDetailDisclosure)
    button.buttonType.should == UIButtonTypeDetailDisclosure
  end
end