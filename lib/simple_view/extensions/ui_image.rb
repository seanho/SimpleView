module SimpleView
  module UIImageExtensions
    def to_image
      self
    end
  end
end

UIImage.send(:include, SimpleView::UIImageExtensions)