module SimpleView
  module UIView
    attr_accessor :name, :top, :left, :bottom, :right

    def find name
      subviews.each do |subview|
        return subview if subview.name == name
      end
      nil
    end
    alias_method :subview, :find

    def sibling name
      if superview
        superview.find name
      else
        nil
      end
    end

    def closest name
      view = sibling name
      if view.nil? && superview
        view = superview.closest name
      end
      view
    end

    def top
      @top.to_i
    end

    def left
      @left.to_i
    end

    def bottom
      @bottom.to_i
    end

    def right
      @right.to_i
    end

    def invalidate_size
      f = self.frame
      max_width = superview ? superview.bounds.size.width : 0
      max_height = superview ? superview.bounds.size.height : 0

      self.autoresizingMask = UIViewAutoresizingNone
      self.autoresizingMask |= UIViewAutoresizingFlexibleTopMargin if @top.nil?
      self.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin if @left.nil?
      self.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin if @bottom.nil?
      self.autoresizingMask |= UIViewAutoresizingFlexibleRightMargin if @right.nil?
      self.autoresizingMask |= UIViewAutoresizingFlexibleWidth if @left && @right
      self.autoresizingMask |= UIViewAutoresizingFlexibleHeight if @top && @bottom

      if @left && @right
        f.size.width = max_width - left - right
      elsif @right
        f.origin.x = max_width - width - right
      elsif @left.nil? && @right.nil?
        f.origin.x = max_width / 2 - width / 2
      end

      if @top && @bottom
        f.size.height = max_height - top - bottom
      elsif @bottom
        f.origin.y = max_height - height - bottom
      elsif @top.nil? && @bottom.nil?
        f.origin.y = max_height / 2 - height / 2
      end

      self.frame = f
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