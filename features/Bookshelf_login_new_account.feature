Feature: Bookshelf New Account Test

	Users should be able to navigate to the 'Create New Account' page

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We click the New Account link
  Then We ensure the new account page has loaded
