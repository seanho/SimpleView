module UI
  class UIViewBuilder
    STRUCTS_MAP = {
      CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
      CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
      CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
      CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
      UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
      UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
    }

    attr_reader :view

    def build(klass, options = {})
      @view = view_for_class(klass, options)

      unless options.nil?
        options.each do |k,v|
          options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
        end
        self.setValuesForKeysWithDictionary(options)
      end

      @view
    end

    def view_for_class(klass, options = {})
      klass.alloc.initWithFrame(CGRectZero)
    end

    def setValue(value, forUndefinedKey:key)
      @view.setValue(value, forKey: key)
    end
    
    def setBackground_color(color)
      setBackgroundColor(color)
    end
    
    def setBackgroundColor(color)
      @view.backgroundColor = safe_color(color)
    end
    
    def setFont(font)
      @view.font = safe_font(font)
    end
    
    protected
    
    def safe_font(font)
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
    
    def safe_color(color)
      if color.is_a?(String)
        UIColor.from_html(color)
      else
        color
      end
    end
    
    def safe_image(image)
      if image.is_a?(String)
        UIImage.imageNamed(image)
      else
        image
      end
    end
  end
end