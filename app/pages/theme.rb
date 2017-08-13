class Theme < Page
  def initialize
    @id = PageId.new(
        {
            :web => ".col-12 col-12-sm uppercase center",
            :droid => "",
            :ios => ""
        })

    @header = Field.textbox(
        {
            :web => "//h1",
            :droid => "",
            :ios => ""
        })

    super('Theme')
  end

  def page_header
    sleep(2)
    @header.exists?
    @header.text
  end

end

PageRegistry.registerPage(Theme)
