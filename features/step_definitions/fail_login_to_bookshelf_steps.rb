require 'selenium-webdriver'
require 'rubygems'
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

# Sad paths

When(/^We enter an incorrect user email$/) do
  @driver.find_element(:name, 'user[email]').send_keys("thisIsWrong@test.com")
end

When(/^We enter a user name with no email domain$/) do
  @driver.find_element(:name, 'user[email]').send_keys("thisIsWrong")
end

When(/^We enter a blank user email$/) do
  puts "No user email entered"
end

And(/^We enter an incorrect password$/) do
  @driver.find_element(:name, 'user[password]').send_keys("thisIsWrong")
end

And(/^We enter a blank password$/) do
  puts "No password entered"
end

Then(/^We ensure an error message is displayed$/) do
  element = wait.until { @driver.find_element(:class => "vst-failure-message") }
  expect(element.displayed?).to be true
end
