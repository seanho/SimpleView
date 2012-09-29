module SimpleView
  module Builders
    class UITextViewBuilder < UIViewBuilder
      include SimpleView::Builders::HasFont
      include SimpleView::Builders::HasTextColor
    end
  end
end