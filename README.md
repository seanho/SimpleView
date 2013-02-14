# SimpleView

RubyMotion DSL for UIKit.

## Change log

__Version 0.6.x__

Breaking changes:

Block scoping is removed, i.e. no need to pass in locals.

Previous
````ruby
class ViewController
  def viewDidLoad
    setup view, controller: self do
      table_view delegate: controller, dataSource: controller
    end
  end
end
````

Now
````ruby
class ViewController
  def viewDidLoad
    setup view do
      table_view delegate: self, dataSource: self
    end
  end
end
````

`add` is renamed to `add_view` for clarity.

## Installation

Add the gem to your Gemfile

`gem 'simple-view'`

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
class YourViewController < UIViewController
  include SimpleView::Layout

  def viewDidLoad
    setup content_view do
      label top:0, left: 0, width: 200, height: 20, text: "Choose your lucky word", text_color: "#eee"
      image_view top: 50, left: 50, right: 50, image: "sample.jpg"
      toolbar left: 0, right: 0, bottom: 0
    end
  end
end
````

Use block for more control over the view instance

````ruby
def viewDidLoad
  setup view do
    button tint_color: '#f00' do |button|
      button.setTitle "Submit" forState: UIControlStateNormal
    end
  end
end
````

### UIKit support

SimpleView provides shorthand methods for most UIKit classes

````ruby
def viewDidLoad
  setup view do
    label text: 'Hi there!' # shorthand
    add_view UILabel, text: 'Hi there!' # same as above
  end
end
````

- UIActionSheet via `action_sheet`
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

SimpleView can work with any custom views and controls

````ruby
setup view do
  add_view CustomViewClass, name: "custom_view"...
end
````

### Style Template

Define default style and apply to UI classes automatically

````ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    SimpleView::Styles.define UILabel,
      font: "italic 13",
      text_color: "#999"
  end
end

class ViewController
  include SimpleView::Layout

  def viewDidLoad
    setup view do
      label text: "Label with default style!"
    end
  end
end
````

Define custom styles and mix with default style

````ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    SimpleView::Styles.define UILabel,
      font: "13"

    SimpleView::Styles.define :darkcolor,
      text_color: "#999"

    SimpleView::Styles.define :title,
      font: "bold 15"
  end
end

class ViewController
  include SimpleView::Layout

  def viewDidLoad
    setup view do
      label styles: :darkcolor, text: "13 font with dark color"
      label styles: [:darkcolor, :title], text: "bold 15 font with dark color"
    end
  end
end
````

### View positioning and sizing

Position the view without doing a lot of calculation

````ruby
setup view do
  toolbar bottom: 10, left: 10, right: 10
end
````

````ruby
setup view do
  table_view width: 100.percent, height: 100.percent
end
````

### View tagging with string

Tag view with name string and find them with ease

````ruby
def viewDidLoad
  setup view do
    label name: 'desc'
    label name: 'price'
  end
end

def someOtherMethod
  price_label = view.find('price')
  desc_label = price_label.sibling('desc')
end
````