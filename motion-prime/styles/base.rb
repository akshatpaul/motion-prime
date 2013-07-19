motion_require '../views/styles.rb'
MotionPrime::Styles.define :base do
  # basic screen styles
  style :screen,
    background_color: :white

  # basic table styles
  # ----------
  style :table,
    top: 0,
    left: 0,
    width: 320,
    bottom: 0

  # basic form styles
  # ----------
  style :form,
    width: 260,
    left: 30,
    top: 0,
    right: 30,
    bottom: 0,
    background_color: :clear,
    separator_color: :clear,
    scroll_enabled: true

  style :form_field,
    selection_style: UITableViewCellSelectionStyleNone

  # available options for string label:
  # @background_color: COLOR
  # @text_color: COLOR
  style :field_label,
    background_color: :clear,
    text_color: :gray,
    top: 6,
    height: 20,
    left: 0,
    right: 0,
    font: proc { APP_CONFIG[:css_font_base].uifont(12) },
    size_to_fit: true

  # available options for input:
  # @layer: @border_width: FLOAT
  # @layer: @border_color: COLOR
  # @background_color: COLOR
  # @background_image: PATH_TO_FILE
  style :field_input,
    layer: {
      border_width: 1,
      border_color: :gray
    },
    font: proc { APP_CONFIG[:css_font_base].uifont(16) },
    placeholder_font: proc { APP_CONFIG[:css_font_base].uifont(16) },
    background_color: :white,
    left: 0,
    right: 0,
    top: 30,
    bottom: 0,
    padding_top: 4

  # available options for submit button:
  # @button_type: :rounded, :custom
  # @background_color: COLOR
  # @background_image: PATH_TO_FILE
  style :submit_button,
    background_color: :gray,
    left: 0,
    right: 0,
    top: 10,
    height: 44,
    title_color: :white

  style :select_field_button,
    background_color: :white,
    left: 0,
    right: 0,
    top: 30,
    height: 36,
    title_color: 0x16759a,
    title_shadow_color: :white,
    contentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft,
    layer: {
      border_color: :gray,
      border_width: 1
    },
    title_color: :gray,
    title_label: {
      font: proc { APP_CONFIG[:css_font_base].uifont(16) }
    }
  style :select_field_arrow,
    image: "images/forms/select_arrow.png",
    top: 42,
    right: 5,
    width: 9,
    height: 14
end