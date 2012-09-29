module SimpleView
  module Builders
    class UITextFieldBuilder < UIViewBuilder
      include SimpleView::Builders::HasFont
      include SimpleView::Builders::HasTextColor
    end
  end
end