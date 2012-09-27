module Simple
  class UITableViewBuilder < UIViewBuilder
    def view_for_class(klass, options = {})
      style = options.delete(:style) || UITableViewStylePlain
      klass.alloc.initWithFrame(CGRectZero, style: style)
    end

    def setSeparatorColor(color)
      @view.separatorColor = color_with(color)
    end
    alias_method :setSeparator_color, :setSeparatorColor
  end
end