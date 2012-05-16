class UIFont
  def self.parse(str)
    bold = false
    italic = false
    size = UIFont.systemFontSize
    font_name = nil

    str.split(' ').each do |comp|
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
  end
end