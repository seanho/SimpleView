module SimpleView
  class ViewBuilder
    attr_reader :view

    def self.view_for klass, options = {}
      ViewBuilder.new(klass, options).view
    end

    def initialize klass, options = {}
      options = extended_options_with_style klass, options
      convert_primitives_to_objects_in_hash options

      @view = view_for_class klass, klass, options

      setValuesForKeysWithDictionary options

      @view
    end

    def convert_primitives_to_objects_in_hash options
      options.each do |k,v|
        options[k] = STRUCTS_MAP[v.class].call(v) if STRUCTS_MAP.has_key?(v.class)
      end
    end

    def extended_options_with_style klass, options = {}
      style_options = Styles.for(klass) || {}
      style_names = options.delete(:styles)

      if style_names.is_a?(Symbol)
        style = Styles.for style_names
        style_options.merge!(style) unless style.nil?

      elsif style_names.is_a?(Array)
        style_names.each do |style_name|
          style = Styles.for style_name
          style_options.merge!(style) unless style.nil?
        end
      end

      style_options.merge options
    end

    def view_for_class klass, root_klass, options = {}
      if VIEWS_MAP.key?(klass)
        VIEWS_MAP[klass].call root_klass, options
      else
        view_for_class klass.superclass, root_klass, options
      end
    end

    def setValue value, forUndefinedKey: key
      if key.end_with?('Color') || key.end_with?('color')
        view.setValue value.to_color, forKey: key
      elsif key.end_with?('Font') || key.end_with?('font')
        view.setValue value.to_font, forKey: key
      elsif key.end_with?('Image') || key.end_with?('image')
        view.setValue value.to_image, forKey: key
      else
        view.setValue value, forKey: key
      end
    end

    def setBackground_color color
      view.backgroundColor = color.to_color
    end

    def setText_color color
      view.textColor = color.to_color
    end

    def setTint_color color
      @view.tintColor = color.to_color
    end

    STRUCTS_MAP = {
      CGAffineTransform   => Proc.new {|v| NSValue.valueWithCGAffineTransform(v) },
      CGPoint             => Proc.new {|v| NSValue.valueWithCGPoint(v) },
      CGRect              => Proc.new {|v| NSValue.valueWithCGRect(v) },
      CGSize              => Proc.new {|v| NSValue.valueWithCGSize(v) },
      UIEdgeInsets        => Proc.new {|v| NSValue.valueWithUIEdgeInsets(v) },
      UIOffset            => Proc.new {|v| NSValue.valueWithUIOffset(v) }
    }

    VIEWS_MAP = {
      UIView => Proc.new {|klass, options| klass.alloc.initWithFrame CGRectZero },
      UIControl => Proc.new {|klass, options| klass.alloc.init },
      UIActionSheet => Proc.new {|klass, options|
        title = options.delete(:title) || ''
        delegate = options.delete(:delegate)
        cancel_button_title = options.delete(:cancelButtonTitle) || options.delete(:cancel_button_title)
        destructive_button_title = options.delete(:destructiveButtonTitle) || options.delete(:destructive_button_title)
        other_button_titles = options.delete(:otherButtonTitles) || options.delete(:other_button_titles)

        klass.alloc.initWithTitle title,
          delegate: delegate,
          cancelButtonTitle: cancel_button_title,
          destructiveButtonTitle: destructive_button_title,
          otherButtonTitles: other_button_titles, nil
      },
      UIActivityIndicatorView => Proc.new{|klass, options|
        style = options.delete(:style) || UIActivityIndicatorViewStyleWhite
        klass.alloc.initWithActivityIndicatorStyle style
      },
      UIButton => Proc.new{|klass, options|
        button_type = options.delete(:buttonType) || options.delete(:button_type) || UIButtonTypeRoundedRect
        klass.buttonWithType button_type
      },
      UIImageView => Proc.new{|klass, options|
        image = options.delete(:image)
        highlighted_image = options.delete(:highlightedImage) || options.delete(:highlighted_image)

        if !image.nil? && !highlighted_image.nil?
          klass.alloc.initWithImage image.to_image, highlightedImage: highlighted_image.to_image
        elsif !image.nil?
          klass.alloc.initWithImage image.to_image
        else
          klass.alloc.initWithFrame CGRectZero
        end
      },
      UIProgressView => Proc.new{|klass, options|
        style = options.delete(:style) || UIProgressViewStyleDefault
        klass.alloc.initWithProgressViewStyle style
      },
      UISegmentedControl => Proc.new{|klass, options|
        items = options.delete(:items) || []
        klass.alloc.initWithItems items
      },
      UITableView => Proc.new{|klass, options|
        style = options.delete(:style) || UITableViewStylePlain
        klass.alloc.initWithFrame CGRectZero, style: style
      },
      UITableViewCell => Proc.new{|klass, options|
        style = options.delete(:style) || UITableViewCellStyleDefault
        identifier = options.delete(:reuseIdentifier) || options.delete(:reuse_identifier)
        klass.alloc.initWithStyle style, reuseIdentifier: identifier
      }
    }
  end
end