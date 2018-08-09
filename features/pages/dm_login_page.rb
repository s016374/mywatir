require_relative 'base_page'

class DmLoginPage < BasePage
  IDS = {
    username: 'inputUsername',
    password: 'inputPassword'
  }.freeze
  VALUES = {
    login: '登录',
    sign_up: '注册账号',
    forget_password: '忘记密码'
  }.freeze

  def initialize(browser)
    super
    @url = "#{@url}/auth-service/signin"
  end

  def input_username_and_password(username, password)
    @browser.text_field(id: IDS[:username]).set(username)
    @browser.text_field(id: IDS[:password]).set(password)
  end

  def login
    @browser.button(value: VALUES[:login]).click
  end

  def sign_up_exists?
    @browser.button(value: VALUES[:sign_up]).exists?
  end

  def forget_password_exists?
    @browser.button(value: VALUES[:forget_password]).exists?
  end
end
