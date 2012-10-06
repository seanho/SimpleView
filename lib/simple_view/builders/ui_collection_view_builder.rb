module SimpleView
  module Builders
    class UICollectionViewBuilder < UIViewBuilder
      def view_for_class klass, options = {}
        layout = options.delete(:collectionViewLayout) || options.delete(:collection_view_layout) || options.delete(:layout) || UICollectionViewFlowLayout.new
        klass.alloc.initWithFrame(CGRectZero, collectionViewLayout: layout)
      end
    end
  end
end