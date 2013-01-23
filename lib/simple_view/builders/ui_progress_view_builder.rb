module SimpleView
  module Builders
    class UIProgressViewBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UIProgressViewStyleDefault
        klass.alloc.initWithProgressViewStyle(style)
      end
    end
  end
end