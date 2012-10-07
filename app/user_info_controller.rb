class UserInfoController < UIViewController
  include SimpleView::Layout

  DEFAULT_CELL_ID = 'DefaultCellId'

  def viewDidLoad
    super

    @data = [
      [{title: 'mobile', text: '123456789'}],
      [{title: 'email', text: 'nyan.cat@meme.com'}],
      [{title: 'Facebook', text: 'Nyan Cat'}]
    ]

    setup view, controller: self do
      controller.title = 'User Info'

      table_view delegate: controller, dataSource: controller, style: UITableViewStyleGrouped, top: 0, left: 0, bottom: 0, right: 0 do
        view.tableHeaderView = UserInfoHeader.alloc.initWithFrame [[0, 0], [UIViewNoIntrinsicMetric, 80]]
      end
    end
  end

  # UITableView dataSource and delegate

  def numberOfSectionsInTableView tableView
    @data.size
  end

  def tableView tableView, numberOfRowsInSection: section
    @data[section].size
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    cell = tableView.dequeueReusableCellWithIdentifier(DEFAULT_CELL_ID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue2, reuseIdentifier:DEFAULT_CELL_ID)
    cell.textLabel.text = @data[indexPath.section][indexPath.row][:title]
    cell.detailTextLabel.text = @data[indexPath.section][indexPath.row][:text]
    cell
  end

  def tableView tableView, didSelectRowAtIndexPath: indexPath
    tableView.deselectRowAtIndexPath indexPath, animated: true
  end
end

class UserInfoHeader < UIView
  include SimpleView::Layout

  def initWithFrame frame
    if super
      setup self do
        image_view name: 'avatar', image: 'test.jpg',
          width: 50, height: 50, top: 20, left: 10

        label name: 'full_name', text: 'Nyan Cat', font: '16 bold', backgroundColor: 'clear',
          height: 20, top: 20, left: 10, right: 10,
          left_is: 'avatar'

        label text: 'Internet Meme', font: '14', textColor: '#666', backgroundColor: 'clear',
          height: 18, top: 5, left: 10, right: 10,
          left_is: 'avatar', top_is: 'full_name'
      end
    end
    self
  end
end
