module SimpleView
  module Builders
    class UITableViewCellBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UITableViewCellStyleDefault
        identifier = options.delete(:reuseIdentifier) || options.delete(:reuse_identifier)
        klass.alloc.initWithStyle(style, reuseIdentifier: identifier)
      end

      def setImage image
        @view.image = image.to_image
      end

      def setSelectedImage image
        @view.selectedImage = image.to_image
      end
    end
  end
end