module SimpleView
  module Builders
    class UIViewBuilder
      include HasBackgroundColor
      include HasColor
      include HasFont
      include HasTextColor
      include HasTintColor

      STRUCTS_MAP = {
        CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
        CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
        CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
        CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
        UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
        UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
      }

      attr_reader :view

      def build klass, options = {}
        @view = view_for_class klass, options

        if options
          options.each do |k,v|
            options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
          end
          setValuesForKeysWithDictionary options
        end

        @view
      end

      def view_for_class klass, options = {}
        klass.alloc.initWithFrame(CGRectZero)
      end

      def setValue value, forUndefinedKey: key
        @view.setValue value, forKey: key
      end
    end

    module HasBackgroundColor
      def setBackgroundColor color
        @view.backgroundColor = color.to_color
      end
      alias_method :setBackground_color, :setBackgroundColor
    end

    module HasColor
      def setColor color
        @view.color = color.to_color
      end
    end

    module HasFont
      def setFont font
        @view.font = font.to_font
      end
    end

    module HasTextColor
      def setTextColor color
        @view.textColor = color.to_color
      end
      alias_method :setText_color, :setTextColor
      alias_method :setColor, :setTextColor
    end

    module HasTintColor
      def setTintColor color
        @view.tintColor = color.to_color
      end
      alias_method :setTint_color, :setTintColor
    end
  end
end