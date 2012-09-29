# SimpleView

A DSL for UIKit for RubyMotion.

Demo app: [Currency](https://github.com/seanho/CurrencyApp-RubyMotion)

## Installation

Add the gem to your Gemfile

`gem 'simple-view', :git => 'https://github.com/seanho/SimpleView.git'`

Then `bundle install`

Require SimpleView in Rakefile

```ruby
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'simple-view'

Motion::Project::App.setup do |app|
  ...
end

```

## Usage

````ruby
def viewDidLoad
  SimpleView::Layouts.setup(view) do
    label width: 200, height: 20, text: "Choose your lucky word", color: "#eee"
    image_view top: 50, left: 50, right: 50, image: "sample.jpg"
    toolbar anchors: [:bottom]
  end
end
````

Everything inside setup block will be added to the view automatically.

Hash parameters works only on KVC-compliant properties. To configure view object in more detail, use a block

````ruby
def viewDidLoad
  SimpleView::Layouts.setup(view) do
    button do
      @view.setTitle("Submit" forState: UIControlStateNormal)
    end
  end
end
````

### UIKit support
- UIActivityIndicatorView via `activity_indicator`
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
- UISwitch via `switch`
- UITabBar via `tab_bar`
- UITableView via `table_view`
- UITableViewCell via `table_view_cell`
- UITextField via `text_field`
- UITextView via `text_view`
- UIToolbar via `toolbar`
- UIView via `rect`
- UIWebView via `web_view`

### Custom view support

SimpleView works not only with UIKit, custom or 3rd party created views and controls can also be used

````ruby
SimpleView::Layouts.setup(view) do
  add CustomViewClass, name: "custom_view"...
end
````

### Style Template

_Experimental. Might change in future._

Define a style and apply to multiple views with ease.

````ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    SimpleView::Styles.define :tag_label,
      font: "italic 13",
      text_color: "#999"
  end
end

class ViewController
  def viewDidLoad
    SimpleView::Layouts.setup(view, controller: self) do
      label styles: :tag_label, text: "Left", anchors: [:left]
      label styles: :tag_label, text: "Right", anchors: [:right]
    end
  end
end
````


### View anchoring

````ruby
SimpleView::Layouts.setup(view) do
  toolbar bottom: 10, left: 10, right: 10, anchors: [:bottom]
end
````

### Passing in locals

Hash parameters will automatically turns into instance variable within the block

````ruby
def viewDidLoad
  SimpleView::Layouts.setup(view, controller: self) do
    table_view delegate: @controller, dataSource: @controller
  end
end
````

### View tagging with string

No need to declare ivar, no need to use integer tag, just name your view and access it by the name.

````ruby
def viewDidLoad
  SimpleView::Layouts.setup(view) do
    label name: "price_label" # give a name to the label
  end
end

def someOtherMethod
  view.subview("price_label") # get the label
end
````