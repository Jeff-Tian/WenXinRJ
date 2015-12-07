Feature: Weixinrj has Ranking function

  Scenario: Log in
    When I go to "http://weixinrj.com/index.php?g=Home&m=Index&a=login"
    When I fill in "username" with "你的用户名"
    And I fill in "password" with "你的密码"
    And I wait for human to input the captcha
    And I press "登录"
    And I wait for "5" seconds
    And I close the AD window
    And I click "功能管理"
    And I go to the link of "人气冲榜"
    And I click "人气榜"
    And I copy the table content page by page
    And I output the copied contents
    Then I wait for "60" seconds