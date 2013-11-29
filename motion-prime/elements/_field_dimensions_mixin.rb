module MotionPrime
  module ElementFieldDimensionsMixin
    def text_value
      if button?
        text = view ? view.titleLabel.text : computed_options[:title]
      else
        text = view ? view.text : computed_options[:text]
      end.to_s
    end

    def content_text
      text = text_value
      if !button? && text.empty?
        text = computed_options[:placeholder]
      end
      text.to_s
    end

    def font
      if button?
        font = computed_options[:title_label][:font]
      else
        font = computed_options[:placeholder_font] if text_value.empty?
        font ||= computed_options[:font]
      end
      font || :system.uifont
    end

    def content_width
      min_width = computed_options[:min_width].to_f
      return min_width if content_text.empty?

      attributed_text = NSAttributedString.alloc.initWithString(content_text, attributes: {NSFontAttributeName => font })
      rect = attributed_text.boundingRectWithSize([Float::MAX, Float::MAX], options:NSStringDrawingUsesLineFragmentOrigin, context:nil)

      width = rect.size.width.ceil
      [[width, computed_options[:max_width]].compact.min, min_width].max
    end

    def content_height
      min_height = computed_options[:min_height].to_f
      return min_height if content_text.blank?

      width = computed_options[:width]
      raise "Please set element width for height calculation" unless width

      attributes = {NSFontAttributeName => font }
      attributed_text = NSAttributedString.alloc.initWithString(content_text, attributes: attributes)
      rect = attributed_text.boundingRectWithSize([width, Float::MAX], options:NSStringDrawingUsesLineFragmentOrigin, context:nil)
      height = rect.size.height.ceil
      [[height, computed_options[:max_height]].compact.min, min_height].max
    end

    private
      def button?
        self.is_a?(ButtonElement)
      end
  end
end