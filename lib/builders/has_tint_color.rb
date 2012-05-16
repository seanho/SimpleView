module UI
  module Builders
    module HasTintColor
      def setTintColor(color)
        @view.tintColor = safe_color(color)
      end

      def setTint_color(color)
        setTintColor(color)
      end
    end
  end
end