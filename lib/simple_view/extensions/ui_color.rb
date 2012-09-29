module SimpleView
  module UIColor
    def to_color
      self
    end
  end
end

UIColor.send(:include, SimpleView::UIColor)