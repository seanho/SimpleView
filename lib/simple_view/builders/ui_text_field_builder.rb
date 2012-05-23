module UI
  class UITextFieldBuilder < UIViewBuilder
    include UI::Builders::HasFont
    include UI::Builders::HasTextColor
  end
end