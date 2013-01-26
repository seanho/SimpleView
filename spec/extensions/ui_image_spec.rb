describe "SimpleView::UIImageExtensions" do
  describe "#to_image" do
    it "should return self" do
      image = UIImage.imageNamed "test.jpg"
      image.to_image.should == image
    end
  end
end