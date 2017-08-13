class Driver
  include Cucumber::RbSupport::RbWorld

  @@DRIVER = nil
  $PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
  DRIVER_KEY ||= :web
  XPATH_IDENTIFIER ||= '//'

  def self.platform
    Platform::WEB
  end

  def self.get_driver
    @@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
  end

  def driver_key
    DRIVER_KEY
  end

  def locator_from_id_map(id_map)
    id_map[driver_key]
  end

  def click(id_map)
    get_screenshot
    locator = locator_from_id_map(id_map)
    return if locator.empty?
    B.element(get_selector(locator) => locator).wait_until_present(30)
    B.element(get_selector(locator) => locator).click
    Watir::Wait.until { B.ready_state == "complete" }
    # wait_for_loader_to_disappear
  end

  def exists?(id_map, wait=true)
    locator = locator_from_id_map(id_map)
    return false if locator.blank?
    begin
      wait_until_present(locator) if wait
      is_present? (locator)
    rescue TimeoutError, Selenium::WebDriver::Error::UnhandledAlertError
      p "exists error #{locator}"
      false
    end
  end

  def wait_for_loader_to_disappear
    B.element(:xpath => "//form[@id='editor aui editor-loading editor-loading-spinner']").wait_while_present
  end

  def is_present?(locator)
    B.element(get_selector(locator) => locator).present?
  end

  def wait_until_present(locator)
    B.element(get_selector(locator) => locator).wait_until_present(30)
  end

  def text(id_map)
    get_screenshot
    locator = locator_from_id_map(id_map)
    wait_until_present locator
    B.element(get_selector(locator) => locator).text
  end

  def set_text(value, id_map)
    get_screenshot
    locator = locator_from_id_map(id_map)
    wait_until_present locator
    B.element(get_selector(locator) => locator).send_keys value
  end

  def done(value, id_map)
    locator = locator_from_id_map(id_map)
    B.element(get_selector(locator) => locator).send_keys value
  end

  def clear(id_map)
    locator = locator_from_id_map(id_map)
    B.text_field(get_selector(locator) => locator).clear
  end

  def page_url
    B.url
  end

  def set_drop_down_val(value, id_map)
    locator = locator_from_id_map(id_map)
    B.select(get_selector(locator) => locator).select_value(value)
  end

  def scroll_bottom(id_map)
    sleep(2)
    B.execute_script("window.scrollBy(0,4000)")
  end

  def get_screenshot
    @@s_count ||= 0
    screen_path = B.driver.save_screenshot "#{$PROJECT_ROOT}/web_images/#{@@s_count}.png"
    $IMAGE_ARR << File.expand_path(screen_path)
    @@s_count+=1
  end

  private
  def get_selector(locator)
    (locator.start_with? XPATH_IDENTIFIER) ? :xpath : :css
  end

end
