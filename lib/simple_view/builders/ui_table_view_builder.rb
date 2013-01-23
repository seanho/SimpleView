module SimpleView
  module Builders
    class UITableViewBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UITableViewStylePlain
        klass.alloc.initWithFrame(CGRectZero, style: style)
      end
    end
  end
end