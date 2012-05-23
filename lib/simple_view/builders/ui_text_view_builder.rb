module UI
  class UITextViewBuilder < UIViewBuilder
    include UI::Builders::HasFont
    include UI::Builders::HasTextColor
  end
end