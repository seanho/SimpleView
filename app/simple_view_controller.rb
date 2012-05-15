class SimpleViewController < UIViewController
  def viewDidLoad
    self.title = "SimpleView Demo"
    @items = ["TextMate", "Vim", "TextEdit", "Notepad", "Xcode"]
    
    UI::Layout.setup(view, controller: self) do
      view width: 20, height: 20, backgroundColor: "#000", anchors: [:top, :left, :bottom, :right]
                        
      view width: 20, height: 20, backgroundColor: "#990000", anchors: [:top, :left]
      view width: 20, height: 20, backgroundColor: "#993300", anchors: [:top]
      view width: 20, height: 20, backgroundColor: "#CC9900", anchors: [:top, :right]
      
      view width: 20, height: 20, backgroundColor: "#006600", anchors: [:left]
      view width: 20, height: 20, backgroundColor: "#336666", anchors: []
      view width: 20, height: 20, backgroundColor: "#0033FF", anchors: [:right]
      
      view width: 20, height: 20, backgroundColor: "#000099", anchors: [:bottom, :left]
      view width: 20, height: 20, backgroundColor: "#660099", anchors: [:bottom]
      view width: 20, height: 20, backgroundColor: "#990066", anchors: [:bottom, :right]
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