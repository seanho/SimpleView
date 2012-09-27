module Simple
  class UIActivityIndicatorViewBuilder < UIViewBuilder
    include Simple::Builders::HasColor

    def view_for_class(klass, options = {})
      style = options.delete(:style) || UIActivityIndicatorViewStyleWhite
      klass.alloc.initWithActivityIndicatorStyle(style)
    end
  end
end