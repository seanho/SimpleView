module SimpleView
  module Builders
    class UIControlBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        klass.alloc.init
      end
    end
  end
end