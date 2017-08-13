require 'pry'
class Page
attr_reader :name, :id

def initialize(name)
  @name   = name
  @driver = Driver.get_driver
end

def current_page?(wait=30)
  @id.exists?
end

end
