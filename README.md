# SimpleView

A DSL for UIKit for RubyMotion.

* Simpler view declaration syntax
* UIView helper methods
* View tagging with string

## Installation
The lazy and dirty way is to copy the source files into your own project.

Or refer to the blog post [Using 3rd Party Ruby Library in RubyMotion](http://reality.hk/posts/2012/05/05/using-3rd-party-ruby-library-rubymotion/).

## Usage

````ruby
def viewDidLoad
  UI::Layout.setup(view) do
    label width: 200, height: 20, text: "Choose your lucky word", color: UIColor.darkGrayColor
    image_view top: 50, left: 50, right: 50, image:UIImage.imageName("sample.jpg")
  end
end
````

Everything inside setup block will be added to the view automatically.

Hash parameters works only on KVC-compliant properties. To configure view object in more detail, use a block

````ruby
def viewDidLoad
  UI::Layout.setup(view) do
    button do
      @view.setTitle("Submit" forState: UIControlStateNormal)
    end
  end
end
````

### UIKit support
- UIButton via `button`
- UIDatePicker via `date_picker`
- UIImageView via `image_view`
- UILabel via `label`
- UIPageControl via `page_control`
- UIPickerView via `picker_view`
- UIProgressView via `progress_view`
- UIScrollView via `scroll_view`
- UISearchBar via `search_bar`
- UISegmentedControl via `segmented_control`
- UISlider via `slider`
- UIStepper via `stepper`
- UISwitch via `swtich`
- UITabBar via `tab_bar`
- UITableView via `table_view`
- UITableViewCell via `table_view_cell`
- UITextField via `text_field`
- UITextView via `text_view`
- UIToolbar via `toolbar`
- UIWebView via `web_view`

### Custom view support

````ruby
def viewDidLoad
  UI::Layout.setup(view) do
    add CustomViewClass, name: "custom_view"...
  end
end
````

### View anchoring

````ruby
def viewDidLoad
  UI::Layout.setup(view) do
    toolbar bottom: 10, left: 10, right: 10, anchors: [:left, :right, :bottom]
  end
end
````

### Passing in locals

Hash parameters will automatically turns into instance variable within the block

````ruby
def viewDidLoad
  UI::Layout.setup(view, controller: self) do
    table_view delegate: @controller, dataSource: @controller
  end
end
````

### View tagging with string

No need to declare ivar, no need to use integer tag, just name your view and access it by the name.

````ruby
def viewDidLoad
  UI::Layout.setup(view) do
    label name: "price_label" # give a name to the label
  end
end

def someOtherMethod
  view.subview("price_label") # get the label
end
````