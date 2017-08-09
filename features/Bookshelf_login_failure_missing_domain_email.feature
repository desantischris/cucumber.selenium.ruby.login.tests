Feature: Bookshelf Missing Email Domain Login Test

	Users should see an error message when using an email with a domain
	on the Bookshelf login page

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We enter a user name with no email domain
  And We enter a correct password
  And We click submit
  Then We ensure an error message is displayed
