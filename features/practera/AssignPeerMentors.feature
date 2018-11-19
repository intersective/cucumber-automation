Feature: Practera assign peer reviewers
	As a program admin
	I want to login to Practera platform
	so that I can assign a mentor to review the assessments from students

    Scenario: Test Practera assign peer reviewers
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr" with assert
		Then I click on "unassigned moderated assessment" which is located at "//*[text()='Moderated 4 - participant no file and video url']/../../td[3]/a" with xpath
		Then I click on "review tab" which is located at "#assessTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I should be able to see a group of "unassigned submissions" which is located at "#tblUnassigned > tbody > tr"
		Then "Practera" I should see the student submission
		Then "Practera" I can assign student2 to the student1 submission
		Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then "Practera" I log out