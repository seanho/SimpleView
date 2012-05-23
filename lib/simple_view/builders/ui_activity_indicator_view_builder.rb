module UI
  class UIActivityIndicatorViewBuilder < UIViewBuilder
    include UI::Builders::HasColor
    
    def view_for_class(klass, options = {})
      style = options.delete(:style) || UIActivityIndicatorViewStyleWhite
      klass.alloc.initWithActivityIndicatorStyle(style)
    end
  end
end