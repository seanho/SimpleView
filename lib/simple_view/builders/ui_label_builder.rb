module SimpleView
  module Builders
    class UILabelBuilder < UIViewBuilder
      include SimpleView::Builders::HasFont
      include SimpleView::Builders::HasTextColor

      def setHighlightedTextColor(color)
        @view.highlightedTextColor = color.to_color
      end
      alias_method :setHighlighted_text_color, :setHighlightedTextColor

      def setShadowColor(color)
        @view.shadowColor = color.to_color
      end
      alias_method :setShadow_color, :setShadowColor
    end
  end
end