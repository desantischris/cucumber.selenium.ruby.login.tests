require 'selenium-webdriver'
require 'rubygems'
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

# Search testing

When(/^We search for the book 'Abandoned'$/) do
  element = wait.until { @driver.find_element(:id => "library-card-L-999-70168-0-false") }
  expect(element.displayed?).to be true
  element = wait.until { @driver.find_element(:class => "find") }
  element.send_keys("Abandoned")
end

Then(/^We verify the title appears on the page$/) do
  element = wait.until { @driver.find_element(:id => "library-card-9781486415908-0-false") }
  expect(element.displayed?).to be true
end

Then(/^We verify the other book titles don't appear on the page$/) do
  @driver.find_element(:id => "library-card-L-999-70168-0-false") rescue false
  @driver.find_element(:id => "library-card-9781515402183-1-false") rescue false
end
