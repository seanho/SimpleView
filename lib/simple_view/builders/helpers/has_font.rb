module SimpleView
  module Builders
    module HasFont
      def setFont font
        @view.font = font.to_font
      end
    end
  end
end