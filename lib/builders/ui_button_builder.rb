module UI
  class UIButtonBuilder < UIControlBuilder
    def view_for_class(klass, options = {})
      button_type = options.delete(:buttonType) || options.delete(:button_type) || UIButtonTypeRoundedRect
      klass.buttonWithType(button_type)
    end
  end
end