class DummyView
  include SimpleView
end

describe "SimpleView" do
  before do
    @base_view = DummyView.new
  end
  
  describe "SimpleView#create_view" do
    it "should create view by class" do
      @base_view.create_view(UILabel).class.should == UILabel
    end
    
    it "should create view and execute block" do
      view = @base_view.create_view(UILabel) do |label|
        label.text = "fun"
      end
      view.text.should == "fun"
    end
  end
  
  describe "SimpleView#button" do
    it "should create UIButton" do
      button = @base_view.button
      button.class.should == UIRoundedRectButton
    end

    it "should create UIButton with style" do
      @base_view.button(UIButtonTypeDetailDisclosure).buttonType.should == UIButtonTypeDetailDisclosure
    end
  end
  
  describe "SimpleView#date_picker" do
    it "should create UIDatePicker" do
      @base_view.date_picker.class.should == UIDatePicker
    end
    
    it "should create UIDatePicker with options" do
      @base_view.date_picker(datePickerMode: UIDatePickerModeDate).datePickerMode.should == UIDatePickerModeDate
    end
  end
  
  describe "SimpleView#image_view" do
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
  
  describe "SimpleView#label" do
    it "should create UILabel" do
      @base_view.label.class.should == UILabel
    end
    
    it "should create UILabel with options" do
      @base_view.label(text: "meh").text.should == "meh"
    end
  end
  
  describe "SimpleView#page_control" do
    it "should create UIPageControl" do
      @base_view.page_control.class.should == UIPageControl
    end
    
    it "should create UIPageControl with options" do
      @base_view.page_control(numberOfPages: 5).numberOfPages.should == 5
    end
  end
  
  describe "SimpleView#picker_view" do
    it "should create UIPickerView" do
      @base_view.picker_view.class.should == UIPickerView
    end
    
    it "should create UIPickerView with options" do
      @base_view.picker_view(showsSelectionIndicator: true).showsSelectionIndicator.should.be.true
    end
  end
  
  describe "SimpleView#progress_view" do
    it "should create UIProgressView" do
      @base_view.progress_view.class.should == UIProgressView
    end
    
    it "should create UIProgressView with style" do
      @base_view.progress_view(UIProgressViewStyleBar).progressViewStyle.should == UIProgressViewStyleBar
    end
    
    it "should create UIProgressView with options" do
      @base_view.progress_view(progressTintColor: UIColor.redColor).progressTintColor.should == UIColor.redColor
    end
  end
  
  describe "SimpleView#scroll_view" do
    it "should create UIScrollView" do
      @base_view.scroll_view.class.should == UIScrollView
    end
    
    it "should create UIScrollView with options" do
      @base_view.scroll_view(contentOffset: CGPointMake(1, 1)).contentOffset.should == CGPointMake(1, 1)
    end
  end
end