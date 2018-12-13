Feature: Practera add participants to a team
	As a program admin
	I want to group students into different teams
	so that they can participate in team assessments

    Scenario: Test Practera add a team
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then I click on "people tag" which is located at "//*[text()='People']/.." with xpath
		Then I wait 2 seconds
		Then I click on "teams tag" which is located at "//*[text()='People']/../..//*[normalize-space()='Teams']" with xpath
		Then I will see a group of "team lists" which is located at "#indextbl > tbody > tr"
		Then I click on "add team button" which is located at ".page-header a"
		Then "Practera Team" I see the add team page
		Then "Practera Team" I create a team name
		Then "Practera Team" I add student1 as a team member
		Then "Practera Team" I add student2 as a team member
		Then I click on "save button" which is located at "#TeamAdminAddForm > .form-actions button:nth-of-type(1)"
		Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then "Practera" I log out