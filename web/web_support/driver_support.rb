require 'watir-webdriver'
require 'pry'
require_relative '../framework/driver'

def create_driver
  driver_path = "#{FilesCollect::ROOT}/drivers/chromedriver"
  driver = Selenium::WebDriver.for :chrome, driver_path: driver_path
  browser = Watir::Browser.new(driver)
  at_exit do
    sleep(2)
    browser.quit
  end
  browser
end

def accept_cookies
  if B.span(:id => 'cn-accept-cookie').exists?
    B.span(:id => 'cn-accept-cookie').click
  end
  if B.div(:class => '_hj-f5b2a1eb-9b07_widget _hj-f5b2a1eb-9b07_ltr _hj-f5b2a1eb-9b07_skin_light _hj-f5b2a1eb-9b07_position_right _hj-f5b2a1eb-9b07_widget_open').exists?
    B.span(:class => '_hj-f5b2a1eb-9b07_widget_icon').click
  end
end

B = create_driver

Before do |scenario|
  $IMAGE_ARR=[]
  B.goto 'http://room5.trivago.com'
  B.window.maximize
  B.wait
  Watir::Wait.until { B.ready_state == 'complete' }
  accept_cookies
end

After do |scenario|
  file_name = scenario.name.gsub(/\W/, '')+".png"
  B.driver.save_screenshot "results/" + file_name
  $IMAGE_ARR << "results/" + file_name
  scenario_slug = scenario.name.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  generate_gif scenario_slug
  # B.close
end


def generate_gif scenario_slug
  create_gif scenario_slug
end




