module SimpleView
  module Builders
    class UITextFieldBuilder < UIControlBuilder
      include SimpleView::Builders::HasFont
      include SimpleView::Builders::HasTextColor
    end
  end
end