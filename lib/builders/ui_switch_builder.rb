module UI
  class UISwitchBuilder < UIControlBuilder
    def setOnTintColor(color)
      @view.onTintColor = color_with(color)
    end
    alias_method :setOn_tint_color, :setOnTintColor
  end
end