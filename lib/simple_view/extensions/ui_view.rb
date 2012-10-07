module SimpleView
  module UIView
    attr_accessor :name, :top, :left, :bottom, :right, :width, :height
    attr_accessor :left_is, :right_is, :top_is, :bottom_is

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

      translate_horizontal_anchors_into_constraints
      translate_vertical_anchors_into_constraints
    end

    def size= value
      @width = value[0]
      @height = value[1]
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

    def width
      @width.to_i
    end

    def height
      @height.to_i
    end

    def add_visual_constraint format, views
      superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat(format,
        options: 0,
        metrics: nil,
        views: views)
    end

    private

    def translate_horizontal_anchors_into_constraints
      left_format = ''
      right_format = ''
      views = {'v' => self, 'r' => view_instance_of(right_is), 'l' => view_instance_of(left_is)}

      if @left_is
        left_format = "[l]-#{left}-"
      elsif @left
        left_format = "|-#{left}-"
      end

      if @right_is
        right_format = "-#{right}-[r]"
      elsif @right
        right_format = "-#{right}-|"
      end

      if left_format.empty? && right_format.empty?
        add_visual_constraint "H:[v(#{width})]", views
        superview.addConstraint NSLayoutConstraint.constraintWithItem self,
            attribute: NSLayoutAttributeCenterX,
            relatedBy: NSLayoutRelationEqual,
            toItem: superview,
            attribute: NSLayoutAttributeCenterX,
            multiplier: 1,
            constant: 0
      elsif !left_format.empty? && !right_format.empty?
        add_visual_constraint "H:#{left_format}[v]#{right_format}", views
      else
        add_visual_constraint "H:#{left_format}[v(#{width})]#{right_format}", views
      end
    end

    def translate_vertical_anchors_into_constraints
      top_format = ''
      bottom_format = ''
      views = {'v' => self, 't' => view_instance_of(top_is), 'b' => view_instance_of(bottom_is)}

      if @top_is
        top_format = "[t]-#{top}-"
      elsif @top
        top_format = "|-#{top}-"
      end

      if @bottom_is
        bottom_format = "-#{bottom}-[b]"
      elsif @bottom
        bottom_format = "-#{bottom}-|"
      end

      if top_format.empty? && bottom_format.empty?
        add_visual_constraint "V:[v(#{height})]", views
        superview.addConstraint NSLayoutConstraint.constraintWithItem self,
            attribute: NSLayoutAttributeCenterY,
            relatedBy: NSLayoutRelationEqual,
            toItem: superview,
            attribute: NSLayoutAttributeCenterY,
            multiplier: 1,
            constant: 0
      elsif !top_format.empty? && !bottom_format.empty?
        add_visual_constraint "V:#{top_format}[v]#{bottom_format}", views
      else
        add_visual_constraint "V:#{top_format}[v(#{height})]#{bottom_format}", views
      end
    end

    def view_instance_of view
      return nil if view.nil?
      view.is_a?(String) ? closest(view) : view
    end
  end
end

UIView.send(:include, SimpleView::UIView)