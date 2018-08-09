class BasePage
  include DmHelper

  def initialize(browser)
    @browser = browser
    @url = ENV['BASE_URL']
  end

  def visit
    @browser.goto @url
  end

  def click_dom_by_xpath(val)
    @browser.element(xpath: @xpaths[val]).click
  end
end
