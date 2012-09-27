module Simple
  module Builders
    module HasTintColor
      def setTintColor(color)
        @view.tintColor = color_with(color)
      end
      alias_method :setTint_color, :setTintColor
    end
  end
end