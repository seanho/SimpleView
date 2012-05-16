module UI
  module BuilderHelpers
    def font_with(font)
      if font.is_a?(String)
        bold = false
        italic = false
        size = UIFont.systemFontSize
        font_name = nil

        font.split(' ').each do |comp|
          if comp == "bold"
            bold = true
          elsif comp == "italic"
            italic = true
          elsif comp.to_f > 0
            size = comp.to_f
          elsif comp.length > 4
            font_name = comp
          end
        end

        if font_name
          UIFont.fontWithName(font_name, size: size)
        elsif bold
          UIFont.boldSystemFontOfSize(size)
        elsif italic
          UIFont.italicSystemFontOfSize(size)
        else
          UIFont.systemFontOfSize(size)
        end
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