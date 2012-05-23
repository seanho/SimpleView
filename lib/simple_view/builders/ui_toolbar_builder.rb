module UI
  class UIToolbarBuilder < UIViewBuilder
    include UI::Builders::HasTintColor
    
    def setBackgroundImage(image, forToolbarPosition: position, barMetrics: metrics)
      @view.setBackgroundImage(image_with(image), forToolbarPosition: position, barMetrics: metrics)
    end
  end
end