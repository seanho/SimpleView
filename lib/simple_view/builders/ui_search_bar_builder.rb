module UI
  class UISearchBarBuilder < UIViewBuilder
    include UI::Builders::HasTintColor
    
    def setBackgroundImage(image)
      @view.backgroundImage = image_with(image)
    end

    def setImage(image, forSearchBarIcon: icon, state: state)
      @view.setImage(image_with(image), forSearchBarIcon: icon, state: state)
    end
    
    def setSearchFieldBackgroundImage(image, forState:state)
      @view.setSearchFieldBackgroundImage(image_with(image), forState:state)
    end
    
    def setScopeBarBackgroundImage(image)
      @view.scopeBarBackgroundImage = image_with(image)
    end
    
    def setScopeBarButtonBackgroundImage(image, forState: state)
      @view.setScopeBarButtonBackgroundImage(image_with(image), forState: state)
    end
    
    def setScopeBarButtonDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
      @view.setScopeBarButtonDividerImage(image_with(image), forLeftSegmentState: leftState, rightSegmentState: rightState)
    end
  end
end