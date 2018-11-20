Feature: Practera Assign reviewers to participants
	As a program admin
	I want to login to Practera platform
	so that I can assign a reviewer to review the assessments from participants

    Scenario: Test Practera Assign reviewers to participants
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath
		Then I should see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr"
		Then I click on "unassigned moderated assessment" which is located at "//*[text()='Moderated 4 - participant no file and video url']/../../td[3]/a" with xpath
		Then I click on "review tab" which is located at "#assessTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I will see a group of "unassigned submissions" which is located at "#tblUnassigned > tbody > tr"
		Then "Practera" I should see the student submission
		Then "Practera" I can assign mentor1 to the student submission
		Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then "Practera" I log out