Feature: Case Freemium Case Study Detail
	As an educator
	I want to have a page shows the case study details
	So that I can understand what the case does

	Scenario: Test Case Freemium Case Study Detail
		Given I go to "http://localhost:4200/home"
		When We click the select case study button
		Then We go to case list page
		Then We see each case with name, image, tag, price
		Then We click one case study
		Then We go to the case detail page
		Then We see the name, image, description and skill tag of the case
		Then We click select this case button
		Then We go to the project dashboard page