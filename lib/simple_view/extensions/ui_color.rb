module SimpleView
  module UIColorExtensions
    def to_color
      self
    end
  end
end

UIColor.send(:include, SimpleView::UIColorExtensions)