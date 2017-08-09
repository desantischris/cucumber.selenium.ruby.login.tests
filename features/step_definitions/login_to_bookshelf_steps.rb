require 'selenium-webdriver'
require 'rubygems'
wait = Selenium::WebDriver::Wait.new(:timeout => 8) # seconds

# Login page verification

Given(/^We navigate to the Bookshelf login page$/) do
  @driver.get "https://bookshelf.vitalsource.com/"
end

Then(/^We ensure the Bookshelf login page has loaded$/) do
    element = wait.until { @driver.find_element(:id => "signin-form") }
    expect(element.displayed?).to be true
end

# Credentials happy path

When(/^We enter a correct user email$/) do
  @driver.find_element(:name, 'user[email]').send_keys("omit@test.com")
end

And(/^We enter a correct password$/) do
  @driver.find_element(:name, 'user[password]').send_keys("omit")
end

# Credentials submission

And(/^We click submit$/) do
  @driver.find_element(:id, 'submit-btn').click
end

# Successful login verification

Then(/^We ensure the homepage has loaded$/) do
  # wait for the homepage to load
  element = wait.until { @driver.find_element(:id => "book-list") }
  expect(element.displayed?).to be true

  # dismiss the modal
  element = wait.until { @driver.find_element(:class => "modal-x") }
  expect(element.displayed?).to be true
  element.click
  # wait for the book list to display
  bookElement = wait.until { @driver.find_element(:id => "book-list") }
  expect(bookElement.displayed?).to be true
end

And(/^We verify our books appear on the page$/) do
  book_20000 = wait.until { @driver.find_element(:id => "library-card-L-999-70168-0-false") }
  expect(book_20000.displayed?).to be true

  book_20000_illust = wait.until { @driver.find_element(:id => "library-card-9781515402183-1-false") }
  expect(book_20000_illust.displayed?).to be true

  book_Abandoned = wait.until { @driver.find_element(:id => "library-card-9781486415908-2-false") }
  expect(book_Abandoned.displayed?).to be true
end

# Forget password

When(/^We click the Forgot My Password link$/) do
  @driver.find_element(:class, 'forgot-password').click
end

Then(/^We ensure the 'Reset your Password' page has loaded$/) do
  element = wait.until { @driver.find_element(:css => 'div.account-content.forgot') }
  expect(element.displayed?).to be true
end

# New account

When(/^We click the New Account link$/) do
  @driver.find_element(:link_text, 'Create an account.').click
end

Then(/^We ensure the new account page has loaded$/) do
  element = wait.until { @driver.find_element(:css => 'div.account.registration') }
  expect(element.displayed?).to be true
end

# Security

Given(/^We navigate to the Bookshelf homepage when not logged in$/) do
  @driver.get "https://bookshelf.vitalsource.com/#/"
end

# Logout verification

When(/^We click logout under the account settings$/) do
  @driver.find_element(:css, '#user-dropdown-dom-1 > button > span').click
  @driver.find_element(:css, 'li.context-menu-option.account-sign-out').click
end
