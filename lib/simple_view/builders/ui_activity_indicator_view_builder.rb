module SimpleView
  module Builders
    class UIActivityIndicatorViewBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UIActivityIndicatorViewStyleWhite
        klass.alloc.initWithActivityIndicatorStyle(style)
      end
    end
  end
end