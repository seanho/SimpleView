module SimpleView
  module UIView
    attr_accessor :name, :bottom, :right, :anchors

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

    def translate_anchors_into_constraints
      return if superview.nil?

      @anchors ||= [:top, :left]
      anchor_top = @anchors.include?(:top)
      anchor_left = @anchors.include?(:left)
      anchor_bottom = @anchors.include?(:bottom)
      anchor_right = @anchors.include?(:right)

      if (anchor_left && anchor_right) || (anchor_left && !@right.nil?)
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat("H:|-#{self.left}-[v]-#{self.right}-|",
          options: 0,
          metrics: nil,
          views: {'v' => self})
      elsif anchor_right
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat "H:[v(==#{self.width})]-#{self.right}-|",
          options: 0,
          metrics: nil,
          views: {'v' => self}
      elsif !anchor_left && !anchor_right
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat("H:[v(==#{self.width})]",
          options: 0,
          metrics: nil,
          views: {'v' => self})
        superview.addConstraint NSLayoutConstraint.constraintWithItem self,
          attribute: NSLayoutAttributeCenterX,
          relatedBy: NSLayoutRelationEqual,
          toItem: superview,
          attribute: NSLayoutAttributeCenterX,
          multiplier: 1,
          constant: 0
      else
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat "H:|-#{self.left}-[v(==#{self.width})]",
          options: 0,
          metrics: nil,
          views: {'v' => self}
      end

      if (anchor_top && anchor_bottom) || (anchor_top && !@bottom.nil?)
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat "V:|-#{self.top}-[v]-#{self.bottom}-|",
          options: 0,
          metrics: nil,
          views: {'v' => self}
      elsif anchor_bottom
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat "V:[v(==#{self.height})]-#{self.bottom}-|",
          options: 0,
          metrics: nil,
          views: {'v' => self}
      elsif !anchor_top && !anchor_bottom
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat("V:[v(==#{self.height})]",
          options: 0,
          metrics: nil,
          views: {'v' => self})
        superview.addConstraint NSLayoutConstraint.constraintWithItem self,
          attribute: NSLayoutAttributeCenterY,
          relatedBy: NSLayoutRelationEqual,
          toItem: superview,
          attribute: NSLayoutAttributeCenterY,
          multiplier: 1,
          constant: 0
      else
        superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat "V:|-#{self.top}-[v(==#{self.height})]",
          options: 0,
          metrics: nil,
          views: {'v' => self}
      end
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

    def right
      @right.to_i
    end

    def bottom
      @bottom.to_i
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