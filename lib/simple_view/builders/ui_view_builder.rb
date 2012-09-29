module SimpleView
  module Builders
    class UIViewBuilder
      include SimpleView::Builders::HasBackgroundColor

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
        options = options_for_class klass, options
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

      def options_for_class klass, options = {}
        class_style = SimpleView::Styles.for(klass) || {}
        custom_styles = options.delete(:styles)

        if custom_styles.is_a?(Symbol)
          style = SimpleView::Styles.for(custom_styles)
          class_style.update(style) if style

        elsif custom_styles.is_a?(Array)
          custom_styles.each do |custom_style|
            style = SimpleView::Styles.for(custom_style)
            class_style.update(style) if style
          end
        end

        class_style.update(options)
      end

      def setValue value, forUndefinedKey: key
        @view.setValue value, forKey: key
      end

      protected

      def font_with font
        font.is_a?(String) ? UIFont.parse(font) : font
      end

      def color_with color
        color.is_a?(String) ? UIColor.from_html(color) : color
      end

      def image_with image
        image.is_a?(String) ? UIImage.imageNamed(image) : image
      end
    end
  end
end