module SimpleView
  module Builders
    module HasBackgroundColor
      def setBackgroundColor(color)
        @view.backgroundColor = color.to_color
      end
      alias_method :setBackground_color, :setBackgroundColor
    end
  end
end