module Simple
  class UITextViewBuilder < UIViewBuilder
    include Simple::Builders::HasFont
    include Simple::Builders::HasTextColor
  end
end