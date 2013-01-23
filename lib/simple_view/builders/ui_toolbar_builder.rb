module SimpleView
  module Builders
    class UIToolbarBuilder < UIViewBuilder
      def setBackgroundImage image, forToolbarPosition: position, barMetrics: metrics
        @view.setBackgroundImage image.to_image, forToolbarPosition: position, barMetrics: metrics
      end
    end
  end
end