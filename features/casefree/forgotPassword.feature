Feature: Case Freemium Forgot Password
	As a educator
	I want to reset my password
	so that I can log in after forgetting it

	Scenario: Test Case Freemium Forgot Password
		Given I go to "http://localhost:4200/home"
		When We click the SEND TO MAILBOX button
		Then We go to reset password page
		Then We type new password
		Then We click reset confirm button
		Then We would see the project list