Feature: Weixinrj has Ranking function

  Scenario: Log in And Export the data
    * I go to "http://weixinrj.com/index.php?g=Home&m=Index&a=login"
    * I read the username and password from the "input.json" file
    * I fill in "username" with the username I read
    * I fill in "password" with the password I read
    * I wait for human to input the captcha
    * I press "登录"
    * I wait for "5" seconds
    * I close the AD window
    * I click "功能管理"
    * I go to the link of "人气冲榜"
    * I click "人气榜"
    * I copy the table content page by page
    * I output the copied contents
    * I wait for "5" seconds