module Simple
  module Builders
    module HasBackgroundColor
      def setBackgroundColor(color)
        @view.backgroundColor = color_with(color)
      end
      alias_method :setBackground_color, :setBackgroundColor
    end
  end
end