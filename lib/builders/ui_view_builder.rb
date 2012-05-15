module UI
  class UIViewBuilder
    STRUCTS_MAP = {
      CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
      CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
      CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
      CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
      UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
      UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
    }

    attr_reader :view

    def build(klass, options = {})
      @view = view_for_class(klass, options)

      unless options.nil?
        options.each do |k,v|
          options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
        end
        self.setValuesForKeysWithDictionary(options)
      end

      @view
    end

    def view_for_class(klass, options = {})
      klass.alloc.initWithFrame(CGRectZero)
    end

    def setValue(value, forUndefinedKey:key)
      @view.setValue(value, forKey: key)
    end
  end
end