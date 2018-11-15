Feature: Practera create an event in a timeline
	As a program admin
	I want to have an event during a specfic of time
	so that the students can participate in the event

    Scenario: Test ractera create an event in a timeline
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "peprogramAdminAccount" and "peprogramAdminAccountPassword"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "Automation Timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I click on "calendar tab" which is located at "//*[text()='Calendar']/../.." with xpath
		Then I click on "today button" which is located at "div#calendar button.fc-today-button"
		Then I wait 2 seconds
		Then "Practera" I can create an event today
		Then I wait 2 seconds
		Then "Practera" I log out