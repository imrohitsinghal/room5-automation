class Textbox < Element
  def initialize(id_map)
    super(id_map)
  end

  def set_text(value,*locator_params)
    @driver.set_text(value, interpolate_locators(*locator_params))
  end

  def clear(*locator_params)
    @driver.clear(interpolate_locators(*locator_params))
  end

  def done(value,*locator_params)
    @driver.done(value,interpolate_locators(*locator_params))
  end

end