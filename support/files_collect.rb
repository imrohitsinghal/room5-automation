require 'pry'
module FilesCollect
  ROOT = Dir.pwd

  PROJECT_FILES = %w( /app/*.rb /app/pages/**/*.rb /framework/**/*.rb
                   /step_definitions/*.rb)

  def self.require_common_files
    PROJECT_FILES.each do |dir|
      Dir["#{ROOT}#{dir}"].each { |file| require "#{file}" }
    end
  end

  def self.require_platform_specific_files(platform)
    Dir["#{ROOT}/#{platform}/framework/*.rb"].each { |file| require "#{file}" }
  end

  def self.build_pages
    PageRegistry.build
  end

  def self.set_home_page
    App.set_current_page(Home)
  end

end