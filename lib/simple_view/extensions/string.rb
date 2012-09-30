module SimpleView
  module String
    def underscore
      word = self.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end

    def to_color
      html_colour = self.dup
      html_colour.gsub!(%r{[#;]}, '')

      case html_colour.size
      when 3
        colours = html_colour.scan(%r{[0-9A-Fa-f]}).map { |el| (el * 2).to_i(16) }
      when 6
        colours = html_colour.scan(%r<[0-9A-Fa-f]{2}>).map { |el| el.to_i(16) }
      else
        raise ArgumentError
      end

      ::UIColor.colorWithRed(colours[0]/255.0, green: colours[1]/255.0, blue: colours[2]/255.0, alpha: 1)
    end

    def to_font
      bold = false
      italic = false
      size = ::UIFont.systemFontSize
      font_name = nil

      self.split(' ').each do |comp|
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
        ::UIFont.fontWithName(font_name, size: size)
      elsif bold
        ::UIFont.boldSystemFontOfSize(size)
      elsif italic
        ::UIFont.italicSystemFontOfSize(size)
      else
        ::UIFont.systemFontOfSize(size)
      end
    end

    def to_image
      ::UIImage.imageNamed self
    end
  end
end

String.send(:include, SimpleView::String)