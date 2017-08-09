Feature: Bookshelf Blank Email Login Test

	Users should see an error message when using blank email 
	on the Bookshelf login page

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We enter a blank user email
  And We enter a correct password
  And We click submit
  Then We ensure an error message is displayed
