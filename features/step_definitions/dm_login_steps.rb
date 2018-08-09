Given(/^visit dm$/) do
  @dm_login_page = DmLoginPage.new @browser
  @dm_login_page.visit
end

When(/^input username "(.*)" password "(.*)"$/) do |username, password|
  @dm_login_page.input_username_and_password username, password
end

Then(/^check sign up and forget password$/) do
  @dm_login_page.sign_up_exists?
  @dm_login_page.forget_password_exists?
end

Then(/^login and enter landing page "(.*)"$/) do |page|
  @dm_login_page.login
  url = @dm_login_page.page_url
  expect(url).to include(page)
end

Given(/^login with "(.*)" "(.*)"$/) do |username, password|
  @dm_login_page = DmLoginPage.new @browser
  @dm_login_page.visit
  @dm_login_page.input_username_and_password username, password
  @dm_login_page.login
end
