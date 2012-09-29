module SimpleView
  module Builders
    class UISegmentedControlBuilder < UIControlBuilder
      include SimpleView::Builders::HasTintColor

      def view_for_class(klass, options = {})
        items = options.delete(:items) || []
        klass.alloc.initWithItems(items)
      end

      def setImage(image, forSegment: segment)
        @view.setImage(image.to_image, forSegment: segment)
      end

      def setImage(image, forSegmentAtIndex: index)
        @view.setImage(image.to_image, forSegmentAtIndex: index)
      end

      def setBackgroundImage(image, forState: state, barMetrics: metrics)
        @view.setBackgroundImage(image.to_image, forState: state, barMetrics: metrics)
      end

      def setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
        @view.setDividerImage(image.to_image, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
      end
    end
  end
end