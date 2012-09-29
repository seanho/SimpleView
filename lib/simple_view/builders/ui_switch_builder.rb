module SimpleView
  module Builders
    class UISwitchBuilder < UIControlBuilder
      def setOnTintColor(color)
        @view.onTintColor = color_with(color)
      end
      alias_method :setOn_tint_color, :setOnTintColor
    end
  end
end