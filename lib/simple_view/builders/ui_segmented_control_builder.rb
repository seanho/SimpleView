module SimpleView
  module Builders
    class UISegmentedControlBuilder < UIControlBuilder
      def view_for_class(klass, options = {})
        items = options.delete(:items) || []
        klass.alloc.initWithItems(items)
      end
    end
  end
end