module SimpleView
  module Builders
    class UIImageViewBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        image = extract_image(options, :image)
        highlighted_image = extract_image(options, [:highlightedImage, :highlighted_image])

        if image && highlighted_image
          klass.alloc.initWithImage(image, highlightedImage: highlighted_image)
        elsif image
          klass.alloc.initWithImage(image)
        else
          klass.alloc.initWithFrame(CGRectZero)
        end
      end

      def extract_image(options, key)
        if key.is_a?(Array)
          key.each do |k|
            image = options.delete(k)
            break unless image.nil?
          end
        else
          image = options.delete(key)
        end
        image = UIImage.imageNamed(image) if !image.nil? && image.is_a?(String)
        image
      end

      def setImage(image)
        @view.image = image_with(image)
      end

      def setHighlightedImage(image)
        @view.highlightedImage = image_with(image)
      end
    end
  end
end