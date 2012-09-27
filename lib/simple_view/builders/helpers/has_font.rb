module Simple
  module Builders
    module HasFont
      def setFont(font)
        @view.font = font_with(font)
      end
    end
  end
end