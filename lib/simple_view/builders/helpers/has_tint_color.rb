module SimpleView
  module Builders
    module HasTintColor
      def setTintColor(color)
        @view.tintColor = color.to_color
      end
      alias_method :setTint_color, :setTintColor
    end
  end
end