class SimpleViewController < UIViewController
  def viewDidLoad
    self.title = "SimpleView Demo"
    @items = ["TextMate", "Vim", "TextEdit", "Notepad", "Xcode"]
    
    controller = self
    view.setup do
      self.backgroundColor = UIColor.whiteColor
      
      label frame: CGRectMake(10, 10, 200, 20), 
            text: "Choose your lucky word",
            color: UIColor.darkGrayColor
      
      table_view UITableViewStylePlain, top: 40, width: 320, height: 300, 
                                        delegate: controller, 
                                        dataSource: controller
      
      segmented_control ["High", "Medium", "Low"], name: "lucky_segment", top: 330, left: 10, width: 300
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