module UI
  module Builders
    module Converters
      def font_with(font)
        if font.is_a?(String)
          UIFont.parse(font)
        else
          font
        end
      end

      def color_with(color)
        if color.is_a?(String)
          UIColor.from_html(color)
        else
          color
        end
      end

      def image_with(image)
        if image.is_a?(String)
          UIImage.imageNamed(image)
        else
          image
        end
      end
    end
  end
end