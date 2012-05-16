module UI
  class UIProgressViewBuilder < UIViewBuilder
    def view_for_class(klass, options = {})
      style = options.delete(:style) || UIProgressViewStyleDefault
      klass.alloc.initWithProgressViewStyle(style)
    end
    
    def setProgressImage(image)
      @view.progressImage = image_with(image)
    end
    
    def setTrackImage(image)
      @view.trackImage = image_with(image)
    end
    
    def setProgressTintColor(color)
      @view.progressTintColor = color_with(color)
    end
    alias_method :setProgress_tint_color, :setProgressTintColor
    
    def setTrackTintColor(color)
      @view.trackTintColor = color_with(color)
    end
    alias_method :setTrack_tint_color, :setTrackTintColor
  end
end