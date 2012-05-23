module UI
  module Builders
    module HasTextColor
      def setTextColor(color)
        @view.textColor = color_with(color)
      end
      alias_method :setText_color, :setTextColor
    end
  end
end