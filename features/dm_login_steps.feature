@dm_trunk
@dm_login
Feature: DM login

  Scenario: login DM with username && password
    Given visit dm
    Then check sign up and forget password
    When input username "user" password "passwd"
    Then login and enter landing page "www.a.com"
