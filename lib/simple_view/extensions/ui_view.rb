module SimpleView
  module UIView
    attr_accessor :name, :bottom, :right, :anchors

    def find name
      subviews.each do |subview|
        return subview if subview.name == name
      end
    end
    alias_method :subview, :find

    def invalidate_size
      f = self.frame
      max_width = superview ? superview.bounds.size.width : 0
      max_height = superview ? superview.bounds.size.height : 0

      @anchors ||= [:top, :left]
      anchor_top = @anchors.include?(:top)
      anchor_left = @anchors.include?(:left)
      anchor_bottom = @anchors.include?(:bottom)
      anchor_right = @anchors.include?(:right)

      self.autoresizingMask = UIViewAutoresizingNone
      self.autoresizingMask |= UIViewAutoresizingFlexibleTopMargin unless anchor_top
      self.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin unless anchor_left
      self.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin unless anchor_bottom
      self.autoresizingMask |= UIViewAutoresizingFlexibleRightMargin unless anchor_right
      self.autoresizingMask |= UIViewAutoresizingFlexibleWidth if anchor_left && anchor_right
      self.autoresizingMask |= UIViewAutoresizingFlexibleHeight if anchor_top && anchor_bottom

      if (anchor_left && anchor_right) || (anchor_left && !@right.nil?)
        f.size.width = max_width - self.left - @right.to_i
      elsif anchor_right
        f.origin.x = max_width - self.width - @right.to_i
      elsif !anchor_left && !anchor_right
        f.origin.x = max_width / 2 - f.size.width / 2
      end

      if (anchor_top && anchor_bottom) || (anchor_top && !@bottom.nil?)
        f.size.height = max_height - self.top - @bottom.to_i
      elsif anchor_bottom
        f.origin.y = max_height - self.height - @bottom.to_i
      elsif !anchor_top && !anchor_bottom
        f.origin.y = max_height / 2 - f.size.height / 2
      end

      self.frame = f
    end

    def top
      self.frame.origin.y
    end

    def setTop value
      self.frame = [[self.frame.origin.x, value], [self.frame.size.width, self.frame.size.height]]
    end

    def left
      self.frame.origin.x
    end

    def setLeft value
      self.frame = [[value, self.frame.origin.y], [self.frame.size.width, self.frame.size.height]]
    end

    def width
      self.frame.size.width
    end

    def setWidth value
      self.frame = [[self.frame.origin.x, self.frame.origin.y], [value, self.frame.size.height]]
    end

    def height
      self.frame.size.height
    end

    def setHeight value
      self.frame = [[self.frame.origin.x, self.frame.origin.y], [self.frame.size.width, value]]
    end
  end
end

UIView.send(:include, SimpleView::UIView)