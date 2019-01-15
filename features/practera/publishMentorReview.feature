Feature: Practera Publish reviews from mentors
	As a program admin
	I want to login to Practera platform
	so that I can publish an assessment review from mentors

    Scenario: Test Publish reviews from mentors
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then "Practera" I go to the "Assessments" page
		Then I should see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr"
		Then I click on "ready to publish on moderated assessment" which is located at "//*[text()='Moderated 4 - participant no file and video url']/../../td[5]/a" with xpath
		Then I wait 2 seconds
		Then I will see a group of "ready to publish submissions" which is located at "#tblReady-to-publish > tbody > tr"
		Then "Practera" I should see the student ready to publish submission
		Then "Practera" I can publish the student submission review
		Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then "Practera" I go to the "Assessments" page
		Then I will see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr"
		Then I click on "published on moderated assessment" which is located at "//*[text()='Comprehensive Moderated']/../../td[6]/a" with xpath
		Then I wait 2 seconds
		Then I will see a group of "published submissions" which is located at "#tblPublished > tbody > tr"
		Then "Practera" I can see the student submission review with "Admin Selenium" publisher
		Then "Practera" I log out