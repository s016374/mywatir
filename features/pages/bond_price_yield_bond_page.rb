require_relative 'base_page'

class BondPriceYieldBondPage < BasePage
  def initialize(browser)
    super
    @url = "#{@url}/newdm-beta/#/main/bond/market/price/yieldbond"
    @xpaths = {
      '成交价' => '//*[@id="bond-container"]/div[2]/div/div[2]/div/div[1]/span[2]/label[1]',
      '买入报价' => '//*[@id="bond-container"]/div[2]/div/div[2]/div/div[1]/span[2]/label[2]',
      '卖出报价' => '//*[@id="bond-container"]/div[2]/div/div[2]/div/div[1]/span[2]/label[3]'
    }
  end

end
