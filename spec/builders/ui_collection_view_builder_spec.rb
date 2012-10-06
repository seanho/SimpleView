describe "UICollectionViewBuilder" do
  it "should build UICollectionView" do
    view = SimpleView::Builders::UICollectionViewBuilder.new.build(UICollectionView)
    view.class.should == UICollectionView
  end

  it "should build UICollectionView with UICollectionViewLayout" do
    layout = UICollectionViewFlowLayout.new
    view = SimpleView::Builders::UICollectionViewBuilder.new.build(UICollectionView, layout: layout)
    view.class.should == UICollectionView
    view.collectionViewLayout = layout
  end
end