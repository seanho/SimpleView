module UI
  module Builders
    module HasBackgroundColor
      def setBackgroundColor(color)
        @view.backgroundColor = safe_color(color)
      end

      def setBackground_color(color)
        setBackgroundColor(color)
      end
    end
  end
end