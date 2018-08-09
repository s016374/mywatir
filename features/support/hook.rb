Before('@dm_login') do |_scenario|
  @browser = init_browser
end

Before do |_scenario|
  @browser ||= init_browser_with_cookie
end

After do
  @browser.close
end

After do |_scenario|
  if _scenario.failed? && ENV['UI_TEST_DEBUG'].nil?
    screenshot_file = "screenshots/screenshot_#{Time.now.strftime("%Y-%m-%d-%H%M")}.png"
    @browser.screenshot.save screenshot_file
    embed screenshot_file, 'image/png'

    report_issue_to_fireman unless ENV['FIREMAN_REPORT'].nil?
  end
end

at_exit do
  `scp reports/report.json root@peppa:/root/reports` unless ENV['JENKINS_REPORT'].nil?
end

private
# curl -u user:passwd -X 'POST' -d '{error description}' http://fireman_host/issue
def report_issue_to_fireman(scenario)
  url = "#{ENV['FIREMAN_HOST']}/issue"
  report = { msg: "E: #{scenario}" }
  HTTP.basic_auth(user: ENV['FIREMAN_USER'], pass: ENV['FIREMAN_PASSWORD']).post(url, json: report)
end
