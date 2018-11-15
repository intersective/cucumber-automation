Feature: Case Freemium Delete Project
	As an educator
	I want to delete the current case study
	So that I can add new case study

	Scenario: Test Case Freemium Delete Project
		Given I go to "http://localhost:4200/home"
		When I log in
		Then We are on the project list page
		Then We choose one project
		Then We click the delete button for the project
		Then the project should not be on the project list page