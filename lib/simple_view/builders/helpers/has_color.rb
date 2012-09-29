module SimpleView
  module Builders
    module HasColor
      def setColor(color)
        @view.color = color_with(color)
      end
    end
  end
end