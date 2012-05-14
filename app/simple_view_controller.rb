class SimpleViewController < UIViewController
  def viewDidLoad
    self.title = "SimpleView Demo"
    @items = ["TextMate", "Vim", "TextEdit", "Notepad", "Xcode"]
    
    UI::Layout.setup(view, controller: self) do
      @view.backgroundColor = UIColor.whiteColor
      
      label frame: CGRectMake(10, 10, 200, 20), 
            text: "Choose your lucky word", 
            color: UIColor.darkGrayColor
      table_view top: 40, 
                 left: 0, 
                 right: 0,
                 height: 300, 
                 delegate: @controller, 
                 dataSource: @controller
      segmented_control items: ["High", "Medium", "Low"], 
                        name: "lucky_segment", 
                        left: 10, 
                        right: 10, 
                        bottom: 10, 
                        anchors: [:left, :right, :bottom]
    end
  end
  
  # UITableView dataSource and delegate
  def numberOfSectionsInTableView(tableView)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @items.count
  end

  CellID = "CellIdentifier"
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID)
    cell.textLabel.text = @items[indexPath.row]
    cell
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    
    if indexPath.row < 2
      view.subview("lucky_segment").selectedSegmentIndex = 0
    elsif indexPath.row < 4
      view.subview("lucky_segment").selectedSegmentIndex = 1
    else
      view.subview("lucky_segment").selectedSegmentIndex = 2
    end
  end
end