module SimpleView
  module Builders
    class UIProgressViewBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UIProgressViewStyleDefault
        klass.alloc.initWithProgressViewStyle(style)
      end

      def setProgressImage(image)
        @view.progressImage = image.to_image
      end

      def setTrackImage(image)
        @view.trackImage = image.to_image
      end

      def setProgressTintColor(color)
        @view.progressTintColor = color.to_color
      end
      alias_method :setProgress_tint_color, :setProgressTintColor

      def setTrackTintColor(color)
        @view.trackTintColor = color.to_color
      end
      alias_method :setTrack_tint_color, :setTrackTintColor
    end
  end
end