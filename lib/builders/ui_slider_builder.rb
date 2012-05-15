module UI
  class UISliderBuilder < UIViewBuilder
    def setMinimumTrackImage(image, forStates: state)
      @view.setMinimumTrackImage(safe_image(image), forStates: state)
    end
    
    def setMaximumTrackImage(image, forStates: state)
      @view.setMaximumTrackImage(safe_image(image), forStates: state)
    end
    
    def setThumbImage(image, forStates: state)
      @view.setThumbImage(safe_image(image), forStates: state)
    end
    
    def setThumbImage(image, forState: state)
      @view.setThumbImage(safe_image(image), forState: state)
    end
    
    def setMinimumTrackImage(image, forState: state)
      @view.setMinimumTrackImage(safe_image(image), forState: state)
    end
    
    def setMaximumTrackImage(image, forState: state)
      @view.setMaximumTrackImage(safe_image(image), forState: state)
    end
    
    def setMinimumValueImage(image)
      @view.setMinimumValueImage(safe_image(image))
    end
    
    def setMaximumValueImage(image)
      @view.setMaximumValueImage(safe_image(image))
    end
  end
end