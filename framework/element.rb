
class Element

  def initialize(id_map)
    @id_map = id_map
    @driver = Driver.get_driver
  end

  def click(*locator_params)
    @driver.click(interpolate_locators(*locator_params))
  end

  def exists?(wait=40, *locator_params)
    @driver.exists?(interpolate_locators(*locator_params))
  end

  def text(*locator_params)
    @driver.text(interpolate_locators(*locator_params))
  end

  def get_url
    @driver.page_url
  end

  def scroll_bottom
    @driver.scroll_bottom(@id_map)
  end

  protected
  def interpolate_locators(*values)
    expanded_locators = {}
    values = values.flatten
    @id_map.each do |k, v|
      v.is_a?(Hash) ? locator = v.to_sym : locator = v
      expanded_locators[k] = locator % values if (locator.is_a?(String) and k.eql? @driver.driver_key)
    end
    expanded_locators
  end

end
