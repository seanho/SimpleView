module Simple
  class UIToolbarBuilder < UIViewBuilder
    include Simple::Builders::HasTintColor

    def setBackgroundImage(image, forToolbarPosition: position, barMetrics: metrics)
      @view.setBackgroundImage(image_with(image), forToolbarPosition: position, barMetrics: metrics)
    end
  end
end