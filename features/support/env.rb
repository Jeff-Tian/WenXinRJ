require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
require 'rubygems'
require 'json'

#caps = Selenium::WebDriver::Remote::Capabilities.firefox
#caps.version = "8"
#caps.platform = :WINDOWS

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    :browser => :chrome
    #:browser => :remote,
    #:url => "http://fed434ca87baae8c0d95e1173a7842a5:4e0c7acbb38d06bb3db71dc2fa0dfa1c@hub.testingbot.com:4444/wd/hub",
    #:desired_capabilities => caps
    )
end
