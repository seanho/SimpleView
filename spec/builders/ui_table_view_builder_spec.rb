describe "UITableViewBuilder" do
  it "should build UITableView" do
    view = Simple::UITableViewBuilder.new.build(UITableView)
    view.class.should == UITableView
    view.style.should == UITableViewStylePlain
  end

  it "should build UITableView with style" do
    view = Simple::UITableViewBuilder.new.build(UITableView, style: UITableViewStyleGrouped)
    view.style.should == UITableViewStyleGrouped
  end
end