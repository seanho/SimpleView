module SimpleView
  module Builders
    class UITableViewCellBuilder < UIViewBuilder
      def view_for_class(klass, options = {})
        style = options.delete(:style) || UITableViewCellStyleDefault
        identifier = options.delete(:reuseIdentifier) || options.delete(:reuse_identifier)
        klass.alloc.initWithStyle(style, reuseIdentifier: identifier)
      end
    end
  end
end