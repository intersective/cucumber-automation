Feature: Case Freemium Project List
	As an educator
	I want to have a list of all the projects I'm running
	So that I have clarity about the projects I'm running

	Scenario: Test Case Freemium Project List
		Given I go to "http://localhost:4200/home"
		When We log in with a user who has a project
		Then We see the project list page
		Then We click one project
		Then We go to the project dashboard page