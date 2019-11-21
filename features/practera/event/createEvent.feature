Feature: Practera create an event in a timeline
	As a program admin
	I want to have an event during a specfic of time
	so that the students can participate in the event

    Scenario: Test practera create an event in a timeline
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with username "#(programv2AdminAccount)" and password "#(programAdminPassword)"
		Then I can see "a side bar" which is located at "#sidebar"
		Then "Practera" I go to the "Calendar" page
		Then I click on "today button" which is located at "div#calendar button.fc-today-button"
		Then I wait 2 seconds
		Then "Practera" I can create an event today with activity "Comprehensive Activity" and assessment "check in assessment 1" for "1" seat
		Then I wait 2 seconds
		Then "Practera" I log out