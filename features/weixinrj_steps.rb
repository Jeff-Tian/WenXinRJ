When(/^I go to "(.*?)"$/) do |link|
    visit link
end

When(/^I wait for human to input the captcha$/) do
    page.driver.browser.manage.window.resize_to(1280, 1024)
    fill_in("verifycode2", :with => "", :match => :prefer_exact)
    sleep 5
end

When(/^I wait for "(.*?)" seconds$/) do |seconds|
  sleep seconds.to_i
end

When(/^I close the AD window$/) do
    page.evaluate_script("closeAD()")
end

When /^I click "([^"]*)"$/ do |linkText|
  click_link(linkText)
end

When /^I click on the specific link "([^"]*)"$/ do |linkText|
    find(:xpath, '//nav-header[contains(./text(), linkText)]').click_link('*')
end

When /^I click the hidden link "([^"]*)"$/ do |linkText|
    #find(:xpath, '//a[contains(./text(), linkText)]', visible: false).click()
    find_link('人气冲榜', :visible => :all, :match => :first).click
end

When /^I go to the link of "([^"]*)"$/ do |linkText|
    visit find_link('人气冲榜', :visible => :all, :match => :first)[:href]
end

When /^I open all the top level menus$/ do
    find('a.nav-header').click()
end

myPages = []
When /^I copy the table content$/ do
    html = page.evaluate_script('document.getElementsByClassName("ListProduct")[0].innerHTML')
    myPages.push(html)
end

When /^I copy the table content page by page$/ do
    while 0 < 5 do
        html = page.evaluate_script('document.getElementsByClassName("ListProduct")[0].innerHTML')
        myPages.push(html)

        if page.has_content?('下一页')
            click_link('下一页')
        else
            break
        end
    end
end

When /^I output the copied contents$/ do
    puts myPages.join
    File.open('outputs.html', 'w') do |f|
        f.puts myPages.join
    end
end

Given /^I am on (.+)$/ do |url|
  visit "http://www.youtube.com"
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value, :match => :prefer_exact)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
