module SimpleView
  module FixnumExtensions
    def percent
      self / 100.0
    end
  end
end

Fixnum.send(:include, SimpleView::FixnumExtensions)