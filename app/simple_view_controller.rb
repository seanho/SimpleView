class SimpleViewController < UIViewController
  def viewDidLoad
    self.title = "SimpleView Demo"
    @items = ["Apple", "Orange", "Lemon", "Grape", "Water Melon"]
    
    controller = self
    view.setup do
      self.backgroundColor = UIColor.whiteColor
      
      label frame: CGRectMake(20, 10, 200, 20), 
            text: "SimpleView",
            color: UIColor.darkGrayColor
            
      switch frame: CGRectMake(220, 10, 50, 30)
      
      table_view UITableViewStylePlain, frame: CGRectMake(0, 40, 320, 200), 
                                        delegate: controller, 
                                        dataSource: controller
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
end