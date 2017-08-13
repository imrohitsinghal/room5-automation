require_relative '../../framework/element'

class Field < Element

  def self.element(id_map)
    Element.new(id_map)
  end

  def self.textbox(id_map)
    Textbox.new(id_map)
  end

  def self.dropdown(id_map)
    Dropdown.new(id_map)
  end

end
