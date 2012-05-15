module UI
  class UIProgressViewBuilder < UIViewBuilder
    def view_for_class(klass, options = {})
      style = options.delete(:style) || UIProgressViewStyleDefault
      klass.alloc.initWithProgressViewStyle(style)
    end
    
    def setProgressImage(image)
      @view.progressImage = safe_image(image)
    end
    
    def setTrackImage(image)
      @view.trackImage = safe_image(image)
    end
  end
end