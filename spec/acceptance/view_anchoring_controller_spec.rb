describe 'ViewAnchoringController' do
  tests ViewAnchoringController

  BLOCK_SIZE = 20

  it "should have a view anchored to the four sides of the parent view" do
    view = controller.view.find('fill')
    view.frame.should == controller.view.bounds
  end

  it "should have a view anchored to top left corner" do
    view = controller.view.find('tl')
    view.frame.origin.x.should == 0
    view.frame.origin.y.should == 0
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to top and centered" do
    view = controller.view.find('tc')
    view.center.x.should == controller.view.bounds.size.width / 2
    view.frame.origin.y.should == 0
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to top right corner" do
    view = controller.view.find('tr')
    view.frame.origin.x.should == controller.view.bounds.size.width - BLOCK_SIZE
    view.frame.origin.y.should == 0
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to middle left corner" do
    view = controller.view.find('ml')
    view.frame.origin.x.should == 0
    view.center.y.should == controller.view.bounds.size.height / 2
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to middle and centered" do
    view = controller.view.find('mc')
    view.center.x.should == controller.view.bounds.size.width / 2
    view.center.y.should == controller.view.bounds.size.height / 2
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to middle right corner" do
    view = controller.view.find('mr')
    view.frame.origin.x.should == controller.view.bounds.size.width - BLOCK_SIZE
    view.center.y.should == controller.view.bounds.size.height / 2
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to bottom left corner" do
    view = controller.view.find('bl')
    view.frame.origin.x.should == 0
    view.frame.origin.y.should == controller.view.bounds.size.height - BLOCK_SIZE
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to bottom and centered" do
    view = controller.view.find('bc')
    view.center.x.should == controller.view.bounds.size.width / 2
    view.frame.origin.y.should == controller.view.bounds.size.height - BLOCK_SIZE
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end

  it "should have a view anchored to bottom right corner" do
    view = controller.view.find('br')
    view.frame.origin.x.should == controller.view.bounds.size.width - BLOCK_SIZE
    view.frame.origin.y.should == controller.view.bounds.size.height - BLOCK_SIZE
    view.frame.size.width.should == BLOCK_SIZE
    view.frame.size.height.should == BLOCK_SIZE
  end
end