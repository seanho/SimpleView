module UI
  class UIToolbarBuilder < UIViewBuilder
    def setBackgroundImage(image, forToolbarPosition: position, barMetrics: metrics)
      @view.setBackgroundImage(safe_image(image), forToolbarPosition: position, barMetrics: metrics)
    end
  end
end