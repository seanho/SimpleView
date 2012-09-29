module SimpleView
  module Builders
    module HasColor
      def setColor(color)
        @view.color = color.to_color
      end
    end
  end
end