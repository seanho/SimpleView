module UI
  class UISearchBarBuilder < UIViewBuilder
    def setBackgroundImage(image)
      @view.backgroundImage = safe_image(image)
    end

    def setImage(image, forSearchBarIcon: icon, state: state)
      @view.setImage(safe_image(image), forSearchBarIcon: icon, state: state)
    end
    
    def setSearchFieldBackgroundImage(image, forState:state)
      @view.setSearchFieldBackgroundImage(safe_image(image), forState:state)
    end
    
    def setScopeBarBackgroundImage(image)
      @view.scopeBarBackgroundImage = safe_image(image)
    end
    
    def setScopeBarButtonBackgroundImage(image, forState: state)
      @view.setScopeBarButtonBackgroundImage(safe_image(image), forState: state)
    end
    
    def setScopeBarButtonDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
      @view.setScopeBarButtonDividerImage(safe_image(image), forLeftSegmentState: leftState, rightSegmentState: rightState)
    end
  end
end