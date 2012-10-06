module SimpleView
  module Builders
    class UIActionSheetBuilder < UIViewBuilder
      def view_for_class klass, options = {}
        title = options.delete(:title) || ''
        delegate = options.delete(:delegate)
        cancel_button_title = options.delete(:cancelButtonTitle) || options.delete(:cancel_button_title)
        destructive_button_title = options.delete(:destructiveButtonTitle) || options.delete(:destructive_button_title)
        other_button_titles = options.delete(:otherButtonTitles) || options.delete(:other_button_titles)

        klass.alloc.initWithTitle title, delegate: delegate, cancelButtonTitle: cancel_button_title, destructiveButtonTitle: destructive_button_title, otherButtonTitles: other_button_titles, nil
      end
    end
  end
end