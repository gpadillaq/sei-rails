class DataPdfSetting

  def initialize
    @data = Array.new()
    @pages = Hash.new()
  end

  def add_page(page)
    @pages = @pages.merge(page.to_h)
  end

  def docente(model)
    model
  end

  class Page
    def initialize(number)
      @number = number
      @page = Hash.new()
    end

    def set(field, value)
      @page[field.to_sym] = {value: value}
    end

    def get(field)
      @page[field.to_sym][:value]
    end

    def to_h
      {['page', '_', @number].join.to_sym => @page}
    end
  end
end
