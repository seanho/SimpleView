module SimpleView
  module Builders
    class UISearchBarBuilder < UIViewBuilder
      include SimpleView::Builders::HasTintColor

      def setBackgroundImage(image)
        @view.backgroundImage = image.to_image
      end

      def setImage(image, forSearchBarIcon: icon, state: state)
        @view.setImage(image.to_image, forSearchBarIcon: icon, state: state)
      end

      def setSearchFieldBackgroundImage(image, forState:state)
        @view.setSearchFieldBackgroundImage(image.to_image, forState:state)
      end

      def setScopeBarBackgroundImage(image)
        @view.scopeBarBackgroundImage = image.to_image
      end

      def setScopeBarButtonBackgroundImage(image, forState: state)
        @view.setScopeBarButtonBackgroundImage(image.to_image, forState: state)
      end

      def setScopeBarButtonDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
        @view.setScopeBarButtonDividerImage(image.to_image, forLeftSegmentState: leftState, rightSegmentState: rightState)
      end
    end
  end
end