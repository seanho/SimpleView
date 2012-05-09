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
      @base_view.progress_view(UIProgressViewStyleDefault, progressTintColor: UIColor.redColor).progressTintColor.should == UIColor.redColor
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
  
  describe "SimpleView#search_bar" do
    it "should create UISearchBar" do
      @base_view.search_bar.class.should == UISearchBar
    end
    
    it "should create UISearchBar with options" do
      @base_view.search_bar(barStyle: UIBarStyleBlack).barStyle.should == UIBarStyleBlack
    end
  end
  
  describe "SimpleView#segmented_control" do
    it "should create UISegmentedControl" do
      @base_view.segmented_control.class.should == UISegmentedControl
    end
    
    it "should create UISegmentedControl with items" do
      items = ["ABC"]
      @base_view.segmented_control(items).numberOfSegments.should == 1
    end
    
    it "should create UISegmentedControl with options" do
      @base_view.segmented_control([], tintColor: UIColor.redColor).tintColor.should == UIColor.redColor
    end
  end
  
  describe "SimpleView#slider" do
    it "should create UISlider" do
      @base_view.slider.class.should == UISlider
    end
    
    it "should create UISlider with options" do
      @base_view.slider(minimumValue: 1.0).minimumValue.should == 1.0
    end
  end
  
  describe "SimpleView#stepper" do
    it "should create UIStepper" do
      @base_view.stepper.class.should == UIStepper
    end
    
    it "should create UIStepper with options" do
      @base_view.stepper(minimumValue: 1.0).minimumValue.should == 1.0
    end
  end
  
  describe "SimpleView#switch" do
    it "should create UISwitch" do
      @base_view.switch.class.should == UISwitch
    end
    
    it "should create UISwitch with options" do
      @base_view.switch(on: true).on?.should.be.true
    end
  end
  
  describe "SimpleView#tab_bar" do
    it "should create UITabBar" do
      @base_view.tab_bar.class.should == UITabBar
    end
    
    it "should create UITabBar with options" do
      @base_view.tab_bar(tintColor: UIColor.blueColor).tintColor.should == UIColor.blueColor
    end
  end
  
  describe "SimpleView#table_view" do
    it "should create UITableView" do
      @base_view.table_view.class.should == UITableView
    end
    
    it "should create UITableView with style" do
      @base_view.table_view(UITableViewStyleGrouped).style.should == UITableViewStyleGrouped
    end
    
    it "should create UITableView with options" do
      @base_view.table_view(UITableViewStylePlain, rowHeight: 60).rowHeight.should == 60
    end
  end
  
  describe "SimpleView#table_view_cell" do
    it "should create UITableViewCell" do
      @base_view.table_view_cell.class.should == UITableViewCell
    end
    
    it "should create UITableViewCell with options" do
      @base_view.table_view_cell(UITableViewCellStyleDefault, "", selectionStyle: UITableViewCellSelectionStyleGray).selectionStyle.should == UITableViewCellSelectionStyleGray
    end
  end
  
  describe "SimpleView#text_field" do
    it "should create UITextField" do
      @base_view.text_field.class.should == UITextField
    end
    
    it "should create UITextField with options" do
      @base_view.text_field(textAlignment: UITextAlignmentRight).textAlignment.should == UITextAlignmentRight
    end
  end
  
  describe "SimpleView#text_view" do
    it "should create UITextView" do
      @base_view.text_view.class.should == UITextView
    end
    
    it "should create UITextView with options" do
      @base_view.text_view(textAlignment: UITextAlignmentRight).textAlignment.should == UITextAlignmentRight
    end
  end
  
  describe "SimpleView#toolbar" do
    it "should create UIToolbar" do
      @base_view.toolbar.class.should == UIToolbar
    end
    
    it "should create UIToolbar with options" do
      @base_view.toolbar(barStyle: UIBarStyleBlack).barStyle.should == UIBarStyleBlack
    end
  end
  
  describe "SimpleView#web_view" do
    it "should create UIWebView" do
      @base_view.web_view.class.should == UIWebView
    end
    
    it "should create UIWebView with options" do
      @base_view.web_view(allowsInlineMediaPlayback: true).allowsInlineMediaPlayback.should.be.true
    end
  end
end