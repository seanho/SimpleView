module SimpleView
  module UIImage
    def to_image
      self
    end
  end
end

UIImage.send(:include, SimpleView::UIImage)