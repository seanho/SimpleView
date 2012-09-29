module SimpleView
  module Builders
    module HasTextColor
      def setTextColor(color)
        @view.textColor = color.to_color
      end
      alias_method :setText_color, :setTextColor
    end
  end
end