module SimpleView
  module UIView
    attr_accessor :name, :top, :left, :bottom, :right, :width, :height, :anchors
    attr_accessor :left_to, :right_to, :top_of, :bottom_of

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
      translate_horizontal_anchors_into_constraints
      translate_vertical_anchors_into_constraints
    end

    def size= value
      @width = value[0]
      @height = value[1]
    end

    def add_visual_constraint format
      superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat(format,
        options: 0,
        metrics: nil,
        views: {'v' => self})
    end

    def add_visual_constraint_with another_view, format
      superview.addConstraints NSLayoutConstraint.constraintsWithVisualFormat(format,
        options: 0,
        metrics: nil,
        views: {'v1' => self, 'v2' => view_instance_of(another_view)})
    end

    private

    def translate_horizontal_anchors_into_constraints
      anchor_left = @anchors.include?(:left) || @anchors.include?(:all)
      anchor_right = @anchors.include?(:right) || @anchors.include?(:all)

      if (anchor_left && anchor_right) || (anchor_left && !@right.nil?)
        add_visual_constraint "H:|-#{@left.to_i}-[v]-#{@right.to_i}-|"
      elsif anchor_right
        if @right_to
          add_visual_constraint_with @right_to, "H:[v2]-#{@left.to_i}-[v1]-#{@right.to_i}-|"
        else
          add_visual_constraint "H:[v(#{@width.to_i})]-#{@right.to_i}-|"
        end
      elsif !anchor_left && !anchor_right
        if @left_to.nil? && @right_to.nil?
          add_visual_constraint "H:[v(#{@width.to_i})]"
          superview.addConstraint NSLayoutConstraint.constraintWithItem self,
            attribute: NSLayoutAttributeCenterX,
            relatedBy: NSLayoutRelationEqual,
            toItem: superview,
            attribute: NSLayoutAttributeCenterX,
            multiplier: 1,
            constant: 0
        else
          add_visual_constraint_with @left_to, "H:[v1(#{@width.to_i})]-#{@right.to_i}-[v2]" if @left_to
          add_visual_constraint_with @right_to, "H:[v2]-#{@left.to_i}-[v1(#{@width.to_i})]" if @right_to
        end
      else
        if @left_to
          add_visual_constraint_with @left_to, "H:|-#{@left.to_i}-[v1]-#{@right.to_i}-[v2]"
        else
          add_visual_constraint "H:|-#{@left.to_i}-[v(#{@width.to_i})]"
        end
      end
    end

    def translate_vertical_anchors_into_constraints
      anchor_top = @anchors.include?(:top) || @anchors.include?(:all)
      anchor_bottom = @anchors.include?(:bottom) || @anchors.include?(:all)

      if (anchor_top && anchor_bottom) || (anchor_top && !@bottom.nil?)
        add_visual_constraint "V:|-#{@top.to_i}-[v]-#{@bottom.to_i}-|"
      elsif anchor_bottom
        if @bottom_of
          add_visual_constraint_with @bottom_of, "V:[v2]-#{@top.to_i}-[v1]-#{@bottom.to_i}-|"
        else
          add_visual_constraint "V:[v(#{@height.to_i})]-#{@bottom.to_i}-|"
        end
      elsif !anchor_top && !anchor_bottom
        if @top_of.nil? && @bottom_of.nil?
          add_visual_constraint "V:[v(#{@height.to_i})]"
          superview.addConstraint NSLayoutConstraint.constraintWithItem self,
            attribute: NSLayoutAttributeCenterY,
            relatedBy: NSLayoutRelationEqual,
            toItem: superview,
            attribute: NSLayoutAttributeCenterY,
            multiplier: 1,
            constant: 0
        else
          add_visual_constraint_with @top_of, "V:[v1(#{@height.to_i})]-#{@bottom.to_i}-[v2]" if @top_of
          add_visual_constraint_with @bottom_of, "V:[v2]-#{@top.to_i}-[v1(#{@height.to_i})]" if @bottom_of
        end
      else
        if @top_of
          add_visual_constraint_with @top_of, "V:|-#{@top.to_i}-[v1]-#{@bottom.to_i}-[v2]"
        else
          add_visual_constraint "V:|-#{@top.to_i}-[v(#{@height.to_i})]"
        end
      end
    end

    def view_instance_of view
      view.is_a?(String) ? closest(view) : view
    end
  end
end

UIView.send(:include, SimpleView::UIView)