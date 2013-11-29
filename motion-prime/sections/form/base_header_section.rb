motion_require '../table/base_cell_section'
module MotionPrime
  class BaseHeaderSection < BaseCellSection
    include CellSection
    DEFAULT_HEADER_HEIGHT = 20

    element :title, text: proc { @options[:title] }

    def initialize(options = {})
      @cell_type = :header
      super
    end

    def section_styles
      table.cell_styles(self)
    end

    def container_height
      container_options[:height] || DEFAULT_HEADER_HEIGHT
    end
  end
end