Feature: Bookshelf Login Bypass Test

	Users should not be able to access the Bookshelf homepage without logging in first

Scenario:
  Given We navigate to the Bookshelf homepage when not logged in
  Then We ensure the Bookshelf login page has loaded
