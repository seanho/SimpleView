module SimpleView
  module Builders
    class UISegmentedControlBuilder < UIControlBuilder
      include SimpleView::Builders::HasTintColor

      def view_for_class(klass, options = {})
        items = options.delete(:items) || []
        klass.alloc.initWithItems(items)
      end

      def setImage(image, forSegment: segment)
        @view.setImage(image_with(image), forSegment: segment)
      end

      def setImage(image, forSegmentAtIndex: index)
        @view.setImage(image_with(image), forSegmentAtIndex: index)
      end

      def setBackgroundImage(image, forState: state, barMetrics: metrics)
        @view.setBackgroundImage(image_with(image), forState: state, barMetrics: metrics)
      end

      def setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
        @view.setDividerImage(image_with(image), forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: metrics)
      end
    end
  end
end