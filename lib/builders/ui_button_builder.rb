module UI
  class UIButtonBuilder < UIControlBuilder
    def view_for_class(klass, options = {})
      button_type = options.delete(:buttonType) || options.delete(:button_type) || UIButtonTypeRoundedRect
      klass.buttonWithType(button_type)
    end

    def setImage(image, forState: state)
      @view.setImage(safe_image(image), forState: state)
    end
    
    def setImage(image, forStates: states)
      @view.setImage(safe_image(image), forState, forStates: states)
    end
    
    def setBackgroundImage(image, forState: state)
      @view.setBackgroundImage(safe_image(image), forState, forState: state)
    end
    
    def setBackgroundImage(image, forStates: states)
      @view.setBackgroundImage(safe_image(image), forState, forStates: states)
    end
    
    def setDisabledDimsImage(image)
      @view.setDisabledDimsImage(safe_image(image), forState)
    end
  end
end