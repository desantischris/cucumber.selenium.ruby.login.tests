Feature: Bookshelf Successful Login & Logout Test

	Users should be able to log in and log out of Bookshelf

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We enter a correct user email
  And We enter a correct password
  And We click submit
  Then We ensure the homepage has loaded
  And We verify our books appear on the page

  Given We search for the book 'Abandoned'
  Then We verify the title appears on the page
  And We verify the other book titles don't appear on the page

  When We click logout under the account settings
  Then We ensure the Bookshelf login page has loaded
