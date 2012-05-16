module UI
  module Builders
    module HasFont
      def setFont(font)
        @view.font = safe_font(font)
      end
    end
  end
end