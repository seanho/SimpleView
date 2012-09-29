module SimpleView
  module UIFont
    def to_font
      self
    end
  end
end

UIFont.send(:include, SimpleView::UIFont)