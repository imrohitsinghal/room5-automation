class SearchScreen < Page
  def initialize
    @id = PageId.new(
        {
            :web => ".input search-input-wrapper",
            :droid => "",
            :ios => ""
        })

    @search_box = Field.textbox(
        {
            :web => "#ajax-search-input",
            :droid => "",
            :ios => ""
        })

    @search_results = Field.element({
                                        :web => "//h1[@class='suggested-post-title center uppercase']",
                                        :droid => "",
                                        :ios => ""
                                    })


    super('Search Screen')
  end

  def enter_search text
    @search_box.set_text(text)
  end

  def proceed
    @search_box.done("Keys.ENTER")
  end

  def search_result
    sleep(2)
    @search_results.text
  end




end

PageRegistry.registerPage(SearchScreen)
