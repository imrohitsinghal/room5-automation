class Home < Page
  def initialize
    @id = PageId.new(
        {
            :web => "#editors_pick",
            :droid => "",
            :ios => ""
        })

   @search = Field.element(
    {
        :web => ".room5-icons-search",
        :droid => "",
        :ios => ""
    })

    @navbar = Field.element(
        {
            :web => ".nav-icon",
            :droid => "",
            :ios => ""
        })

    @inspireme_button = Field.element(
        {
            :web => ".etn__submit",
            :droid => "",
            :ios => ""
        })

    @email_id= Field.textbox(
        {
            :web => "#etn_email",
            :droid => "",
            :ios => ""
        })

    @country_dropdown =  Field.dropdown(
        {
            :web => "#select-country",
            :droid => "",
            :ios => ""
        })

    @checked_in = Field.element(
        {
            :web => "//p[@class='center']",
            :droid => "",
            :ios => ""
        })

    @editors_pick = Field.element(
        {
            :web => ".mt-0",
            :droid => "",
            :ios => ""
        })

    @country_id = {
        :france => 'http://room5.trivago.fr',
        :australia => 'http://room5.trivago.com.au',
        :singapore => 'http://room5.trivago.sg'
    }


    super('Home')
  end

  def editors_pick
    @editors_pick.exists?
    @editors_pick.text
  end

  def search_bar
    @search.click
  end

  def inspire_me
    @inspireme_button.click
  end

  def enter_email email
    @email_id.set_text(email)
  end

  def set_country name
    @country_dropdown.select(@country_id[name.to_sym])
  end

  def confirmation
    @checked_in.text
  end

  def select_menu
    @navbar.click
  end

  def scroll_to_bottom
    @navbar.scroll_bottom
  end


end

PageRegistry.registerPage(Home)
