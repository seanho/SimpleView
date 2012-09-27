module Simple
  module Builders
    module Converters
      def font_with font
        font.is_a?(String) ? UIFont.parse(font) : font
      end

      def color_with color
        color.is_a?(String) ? UIColor.from_html(color) : color
      end

      def image_with image
        image.is_a?(String) ? UIImage.imageNamed(image) : image
      end
    end
  end
end