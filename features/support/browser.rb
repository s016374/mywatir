require "watir"
require "selenium/webdriver"
require "http"

def init_browser
  # debug local chrome
  unless ENV['UI_TEST_DEBUG'].nil?
    Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path(ENV['UI_TEST_DEBUG']))
    return Watir::Browser.new :chrome
  end

  # remote headless browser
  case ENV['UI_TEST_BROWSER']
  when 'chrome'
    Watir::Browser.new :chrome, { timeout: ENV['UI_TEST_CLIENT_TIMEOUT'].to_i || 120, url: ENV['UI_TEST_SELENIUM_HUB'] }
  when 'firefox'
    Watir::Browser.new :firefox, { timeout: ENV['UI_TEST_CLIENT_TIMEOUT'].to_i || 120, url: ENV['UI_TEST_SELENIUM_HUB'] }
  end
end

def init_browser_with_cookie
  sid = get_cookie ENV['TEST_USERNAME'], ENV['TEST_PASSWORD']
  b = init_browser
  b.goto ENV['BASE_URL']
  b.cookies.clear
  b.cookies.add('sid', sid, {domain: '.a.com'})
  b.cookies.add('uid', ENV['COOKIE_UID'], {domain: '.a.com'})
  b
end

private
def get_cookie(username, password, is_hash=false)
  url = "#{ENV['BASE_URL']}/auth-service/signin"
  res = HTTP.get(url)
  csrf = res.to_s.split('name="_csrf" value="').last.split('"/>').first
  sid = res.cookies.inspect.to_s.split('"sid", value="').last.split('",').first
  res = HTTP[content_type: 'application/x-www-form-urlencoded']
            .cookies('sid' => sid)
            .post(url, :body => "_csrf=#{csrf}&username=#{username}&password=#{password}")
  sid = res.cookies.inspect.to_s
  return 'auth error' if sid.include? '@jar={}'
  sid = sid.split('"sid", value="').last.split('",').first
  return sid unless is_hash
  { sid: sid, uid: ENV['COOKIE_UID'] }
end
