module UI
  class UISegmentedControlBuilder < UIControlBuilder
    def view_for_class(klass, options = {})
      items = options.delete(:items) || []
      klass.alloc.initWithItems(items)
    end
    
    def setImage(image, forSegment: segment)
      @view.setImage(safe_image(image), forSegment: segment)
    end
    
    def setImage(image, forSegmentAtIndex: index)
      @view.setImage(safe_image(image), forSegmentAtIndex: index)
    end
    
    def setBackgroundImage(image, forState: state, barMetrics: metrics)
      @view.setBackgroundImage(safe_image(image), forState: state, barMetrics: metrics)
    end
    
    def setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
      @view.setDividerImage(safe_image(image), forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
    end
  end
end