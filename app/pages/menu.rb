class Menu < Page
  def initialize
    @id = PageId.new(
        {
            :web => ".nav-icon open",
            :droid => "",
            :ios => ""
        })

    @close_icon = Field.element(
        {
          :web => "//div[@class='nav-icon open']",
          :droid => "",
          :ios => ""
    })

    @menu_option = Field.element(
        {
            :web => "//*[contains(text(), 'All Themes')]",
            :droid => "",
            :ios => ""
        })

    super('Menu')
  end


  def select_menu_option(item)
    @menu_option.click
  end

  def close_nav_menu
    sleep(2)
    @close_icon.exists?
    @close_icon.click
  end

end

PageRegistry.registerPage(Menu)
