module SimpleView
  module Builders
    class UITabBarBuilder < UIViewBuilder
      include SimpleView::Builders::HasTintColor

      def setBackgroundImage(image)
        @view.backgroundImage = image.to_image
      end

      def setSelectedImage(image)
        @view.selectedImage = image.to_image
      end

      def setSelectedImageTintColor(color)
        @view.selectedImageTintColor = color.to_color
      end
      alias_method :setSelected_image_tint_color, :setSelectedImageTintColor
    end
  end
end