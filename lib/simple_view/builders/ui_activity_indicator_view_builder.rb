module SimpleView
  module Builders
    class UIActivityIndicatorViewBuilder < UIViewBuilder
      include SimpleView::Builders::HasColor

      def view_for_class(klass, options = {})
        style = options.delete(:style) || UIActivityIndicatorViewStyleWhite
        klass.alloc.initWithActivityIndicatorStyle(style)
      end
    end
  end
end