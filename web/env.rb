require 'pry'

require_relative '../support/files_collect'
require 'active_support'
require 'watir-webdriver'
require 'bundler/setup'
require 'active_support/core_ext'
require 'nakal/dsl'
require 'nakal/cucumber'
require_relative '../support/nakal_support'
require_relative '../support/monkey_patches/nakal'

# require File.expand_path(File.dirname(__FILE__) + '/../web/framework/driver_support')
#
#
# $PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
# Dir["#{$PROJECT_ROOT}/step_definitions/*.rb"].each { |file| require "#{file}" }
# Dir["#{$PROJECT_ROOT}/web/framework/*.rb"].each { |file| require "#{file}" }
FilesCollect.require_common_files
FilesCollect.require_platform_specific_files 'web'
FilesCollect.build_pages
FilesCollect.set_home_page


$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../'))

unless ENV['NAKAL_MODE'].nil?
  Nakal.embed_screenshot = false
  Nakal.platform = :android
  Nakal.directory= "#{$PROJECT_ROOT}/baseline_images/web"
  Nakal.device_name = ENV['MACHINE_TYPE'].nil? ? "default_device" : ENV['MACHINE_TYPE']
  Nakal.config_location = "#{$PROJECT_ROOT}/config/nakal.yml"
  Nakal.timeout = 5
  Nakal.fuzz = 5
  # Nakal.current_screen = "Default"

  # ENV['PATH'] = File.join(File.dirname(__FILE__), '..', 'mac') + ':' + ENV['PATH']

  at_exit do
    move_nakal_files_to_result_dir("web")
  end

end



