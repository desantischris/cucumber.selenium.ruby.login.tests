Feature: Bookshelf Forgot Password Test

	Users should be able to navigate to the reset password page

Scenario:
  Given We navigate to the Bookshelf login page
  Then We ensure the Bookshelf login page has loaded

  When We click the Forgot My Password link
  Then We ensure the 'Reset your Password' page has loaded
