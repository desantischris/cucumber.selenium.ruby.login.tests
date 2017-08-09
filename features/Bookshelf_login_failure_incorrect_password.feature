Feature: Bookshelf Incorrect Password Login Test

	Users should see an error message when using incorrect password
	on the Bookshelf login page

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We enter a correct user email
  And We enter an incorrect password
  And We click submit
  Then We ensure an error message is displayed
