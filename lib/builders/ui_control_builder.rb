module UI
  class UIControlBuilder < UIViewBuilder
    def view_for_class(klass, options = {})
      klass.alloc.init
    end
  end
end