describe "UIActionSheetBuilder" do
  it "should build UIActionSheet" do
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet)
    view.class.should == UIActionSheet
  end

  it "should build UIActionSheet with title" do
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet, title: 'title')
    view.class.should == UIActionSheet
    view.title.should == 'title'
  end

  it "should build UIActionSheet with delegate" do
    delegate = Object.new
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet, delegate: delegate)
    view.class.should == UIActionSheet
    view.delegate.should == delegate
  end

  it "should build UIActionSheet with cancel title" do
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet, cancel_button_title: 'cancel')
    view.class.should == UIActionSheet
    view.buttonTitleAtIndex(view.cancelButtonIndex).should == 'cancel'
  end

  it "should build UIActionSheet with destructive title" do
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet, destructive_button_title: 'destroy')
    view.class.should == UIActionSheet
    view.buttonTitleAtIndex(view.destructiveButtonIndex).should == 'destroy'
  end

  it "should build UIActionSheet with other title" do
    view = SimpleView::Builders::UIActionSheetBuilder.new.build(UIActionSheet, other_button_titles: 'others')
    view.class.should == UIActionSheet
    view.buttonTitleAtIndex(view.firstOtherButtonIndex).should == 'others'
  end
end