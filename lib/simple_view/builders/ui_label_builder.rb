module UI
  class UILabelBuilder < UIViewBuilder
    include UI::Builders::HasFont
    
    def setTextColor(color)
      @view.textColor = color_with(color)
    end
    alias_method :setText_color, :setTextColor
    
    def setHighlightedTextColor(color)
      @view.highlightedTextColor = color_with(color)
    end
    alias_method :setHighlighted_text_color, :setHighlightedTextColor
    
    def setShadowColor(color)
      @view.shadowColor = color_with(color)
    end
    alias_method :setShadow_color, :setShadowColor
  end
end