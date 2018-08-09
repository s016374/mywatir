Given(/^visit 异常价格 - 高收益债$/) do
  @bond_price_yield_bond_page = BondPriceYieldBondPage.new @browser
  @bond_price_yield_bond_page.visit
end

Given(/^visit 异常价格 - 估值偏高$/) do
  @bond_price_valuation_page = BondPriceValuationPage.new @browser
  @bond_price_valuation_page.visit
end

And(/^click 异常价格 - 高收益债 - (.*)$/) do |tab_name|
  @bond_price_yield_bond_page.click_dom_by_xpath tab_name
end
