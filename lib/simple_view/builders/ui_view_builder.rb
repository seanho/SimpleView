module SimpleView
  module Builders
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

      def build klass, options = {}
        @view = view_for_class klass, options

        if !options.nil?
          convert_primitives_to_objects_in_hash options
          setValuesForKeysWithDictionary options
        end

        @view
      end

      def convert_primitives_to_objects_in_hash options
        options.each do |k,v|
          options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
        end
      end

      def view_for_class klass, options = {}
        klass.alloc.initWithFrame(CGRectZero)
      end

      def setValue value, forUndefinedKey: key
        k = key.downcase

        if k.end_with?('color')
          @view.setValue value.to_color, forKey: key
        elsif k.end_with('font')
          @view.setValue value.to_font, forKey: key
        elsif k.end_with('image')
          @view.setValue value.to_image, forKey: key
        else
          @view.setValue value, forKey: key
        end
      end
    end
  end
end