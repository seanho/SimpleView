describe "UIImageViewBuilder" do
  it "should build UIImageView" do
    image_view = UI::UIImageViewBuilder.new.build(UIImageView)
    image_view.class.should == UIImageView
  end

  it "should build UIImageView with image" do
    image = UIImage.imageNamed "test.jpg"
    image_view = UI::UIImageViewBuilder.new.build(UIImageView, image: image)
    image_view.image.should == image
  end
  
  it "should build UIImageView with image string" do
    image_view = UI::UIImageViewBuilder.new.build(UIImageView, image: "test.jpg")
    image_view.image.class.should == UIImage
  end

  it "should build UIImageView with image and highlightedImage" do
    image = UIImage.imageNamed "test.jpg"
    highlighted = UIImage.imageNamed "test.jpg"
    image_view = UI::UIImageViewBuilder.new.build(UIImageView, image: image, highlightedImage: highlighted)
    image_view.image.should == image
    image_view.highlightedImage.should == highlighted
  end
  
  it "should build UIImageView with image string and highlightedImage string" do
    image_view = UI::UIImageViewBuilder.new.build(UIImageView, image: "test.jpg", highlightedImage: "test.jpg")
    image_view.image.class.should == UIImage
    image_view.highlightedImage.class.should == UIImage
  end
end