class Dropdown < Element

  def initialize(id_map)
    super(id_map)
  end

  def select(value, *locator_params)
    @driver.set_drop_down_val(value,interpolate_locators(*locator_params))
  end

end
