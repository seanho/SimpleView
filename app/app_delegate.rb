class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    views = [UIView,UIActivityIndicatorView,UIButton,UIDatePicker,UIImageView,UILabel,UIPageControl,UIPickerView,UIProgressView,UIScrollView,UISearchBar,UISegmentedControl,UISlider,UIStepper,UISwitch,UITabBar,UITableView,UITableViewCell,UITextField,UITextView,UIToolbar,UIWebView]
        views.each do |view|
          puts "============= #{view}"
          view.public_instance_methods.each do |method|
            puts "#{method}" if method.match(/set.*Color/)
          end
        end
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(SimpleViewController.alloc.init)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
