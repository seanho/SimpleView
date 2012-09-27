module Simple
  class UITabBarBuilder < UIViewBuilder
    include Simple::Builders::HasTintColor

    def setBackgroundImage(image)
      @view.backgroundImage = image_with(image)
    end

    def setSelectedImage(image)
      @view.selectedImage = image_with(image)
    end

    def setSelectedImageTintColor(color)
      @view.selectedImageTintColor = color_with(color)
    end
    alias_method :setSelected_image_tint_color, :setSelectedImageTintColor
  end
end