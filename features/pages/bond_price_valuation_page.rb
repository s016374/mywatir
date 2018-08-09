require_relative 'base_page'

class BondPriceValuationPage < BasePage
  def initialize(browser)
    super
    @url = "#{@url}/newdm-beta/#/main/bond/market/price/valuation"
    @xpaths = {
    }
  end

end
