module Simple
  class UITextFieldBuilder < UIViewBuilder
    include Simple::Builders::HasFont
    include Simple::Builders::HasTextColor
  end
end