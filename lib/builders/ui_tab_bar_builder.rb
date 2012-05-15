module UI
  class UITabBarBuilder < UIViewBuilder
    def setBackgroundImage(image)
      @view.backgroundImage = safe_image(image)
    end
    
    def setSelectedImage(image)
      @view.selectedImage = safe_image(image)
    end
  end
end