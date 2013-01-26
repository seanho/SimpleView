module SimpleView
  module UIFontExtensions
    def to_font
      self
    end
  end
end

UIFont.send(:include, SimpleView::UIFontExtensions)