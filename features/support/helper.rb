module DmHelper
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def helper_class_method
      p 'helper_class_method'
    end
  end

  def dm_helper_goto(page_url)
    @browser.goto page_url
  end

  def dm_helper_capture_screen
    @browser.screenshot.save("screenshots/dm_helper_screenshot_#{Time.now.to_i}.png")
  end

  def page_url
    @browser.url
  end
end
