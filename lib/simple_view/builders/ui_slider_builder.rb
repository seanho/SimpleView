module SimpleView
  module Builders
    class UISliderBuilder < UIControlBuilder
      def setMinimumTrackImage(image, forStates: state)
        @view.setMinimumTrackImage(image_with(image), forStates: state)
      end

      def setMaximumTrackImage(image, forStates: state)
        @view.setMaximumTrackImage(image_with(image), forStates: state)
      end

      def setThumbImage(image, forStates: state)
        @view.setThumbImage(image_with(image), forStates: state)
      end

      def setThumbImage(image, forState: state)
        @view.setThumbImage(image_with(image), forState: state)
      end

      def setMinimumTrackImage(image, forState: state)
        @view.setMinimumTrackImage(image_with(image), forState: state)
      end

      def setMaximumTrackImage(image, forState: state)
        @view.setMaximumTrackImage(image_with(image), forState: state)
      end

      def setMinimumValueImage(image)
        @view.setMinimumValueImage(image_with(image))
      end

      def setMaximumValueImage(image)
        @view.setMaximumValueImage(image_with(image))
      end

      def setMinimumTrackTintColor(color)
        @view.minimumTrackTintColor = color_with(color)
      end
      alias_method :setMinimum_track_tint_color, :setMinimumTrackTintColor

      def setMaximumTrackTintColor(color)
        @view.maximumTrackTintColor = color_with(color)
      end
      alias_method :setMaximum_track_tint_color, :setMaximumTrackTintColor

      def setThumbTintColor(color)
        @view.thumbTintColor = color_with(color)
      end
      alias_method :setThumb_tint_color, :setThumbTintColor
    end
  end
end