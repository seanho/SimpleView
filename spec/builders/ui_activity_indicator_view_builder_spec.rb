describe "UIActivityIndicatorViewBuilder" do
  it "should build UIActivityIndicatorView" do
    view = SimpleView::Builders::UIActivityIndicatorViewBuilder.new.build(UIActivityIndicatorView)
    view.class.should == UIActivityIndicatorView
    view.activityIndicatorViewStyle.should == UIActivityIndicatorViewStyleWhite
  end

  it "should build UIActivityIndicatorView with style" do
    view = SimpleView::Builders::UIActivityIndicatorViewBuilder.new.build(UIActivityIndicatorView, style: UIActivityIndicatorViewStyleGray)
    view.activityIndicatorViewStyle.should == UIActivityIndicatorViewStyleGray
  end
end