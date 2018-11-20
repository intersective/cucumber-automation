Feature: Practera Admin Edit Review
	As a program admin
	I want to login to Practera platform
	so that I can edit the reviews fo student submissions

    Scenario: Test Practera Admin Edit Review
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath
		Then I should see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div> table > tbody > tr"
		Then I click on "moderated assessment's ready to publish" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr:nth-of-type(1) td:nth-of-type(5) > a"
		Then I will see a group of "reviewed submissions" which is located at "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr"
		Then "Practera" I should see the student ready to publish submission
		Then "Practera" I can edit the student submission review
		Then I click on "the start button" which is located at "//*[@id='start-page']/../*[contains(@class, 'form-actions')]/button" with xpath
		Then I wait 2 seconds
		Then I should see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active"
		Then I input "your works are excellent, thank you for submissions from admin_selenium" to "Free text review" which is located at "//span[normalize-space()='Free text review']/../textarea" with xpath scroll
		Then I should not see "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']" with xpath
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
		Then I click on "Normal" which is located at "//span[normalize-space()='Normal']" with xpath scroll
		Then I input "your works are excellent, thank you for submissions from admin_selenium" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 3" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active"
		Then I click on "Choice 0.8" which is located at "//span[normalize-space()='Choice 0.8']" with xpath scroll
		Then I click on "Choice 0.6" which is located at "//span[normalize-space()='Choice 0.6']" with xpath scroll
		Then I input "your work is good from admin_selenium" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 4" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active"
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 5" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(5).active"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "div#assessment-buttons button#submit" with scroll
		Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then "Practera" I log out