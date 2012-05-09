class DummyView
  include SimpleView
end

describe "SimpleView" do
  before do
    @base_view = DummyView.new
  end
  
  describe "#label" do
    it "should create UILabel" do
      @base_view.label.class.should == UILabel
    end
    
    it "should create UILabel with options" do
      @base_view.label(text: "meh").text.should == "meh"
    end
  end
  
  describe "#image_view" do
    it "should create UIImageView" do
      @base_view.image_view.class.should == UIImageView
    end
    
    it "should create UIImageView with image" do
      image = UIImage.imageNamed "cat"
      @base_view.image_view(image).image.should == image
    end
    
    it "should create UIImageView with image and highlighted image" do
      image = UIImage.imageNamed "cat"
      highlighted = UIImage.imageNamed "nyan"
      image_view = @base_view.image_view(image, highlighted)
      image_view.image.should == image
      image_view.highlightedImage.should == highlighted
    end
  end
  
  describe "#button" do
      it "should create UIButton" do
        button = @base_view.button
        button.class.should == UIButton
        button.buttonType.should == UIButtonTypeRoundedRect
      end

      it "should create UIButton with style" do
        button = @base_view.button(UIButtonTypeDetailDisclosure)
        button.buttonType.should == UIButtonTypeDetailDisclosure
      end
  end
end