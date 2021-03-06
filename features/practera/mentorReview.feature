Feature: Practera Mentor Review
	As a program mentor
	I want to login to Practera platform
	so that I can review student submissions

    Scenario: Test Practera Mentor Review
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(mentor2Account)" and password "#(mentor2AccountPassword)"
		Then I can see "a side bar" which is located at "#sidebar"
		Then "Practera" I go to the "Reviews & Feedback" page
		Then I wait 2 seconds
		Then "Practera" I go to the "My Reviews" page
		Then I should see a group of "to review submission" which is located at "#toreview tbody tr"
		Then "Practera" I can go to the review page with the student submission and the assessment "Comprehensive Moderated"
		Then I should see "Files uploaded in submission" which is located at "//*[text()='Files uploaded in submission']" with xpath
		Then "Practera" I check the assessment uploaded file with:
			| file position | file name |
			| 1 | WhatsAppVideo2017-11-30at11.27.14.mp4 |
			| 2 | medium-size-dogs-a-medium.jpg |
			| 3 | VideoUploadissue2.mp4 |
			| 4 | 2017-Scrum-Guide-US.pdf |
		Then I click on "the start button" which is located at "//*[@id='start-page']/../*[contains(@class, 'form-actions')]/button" with xpath
		Then I wait 2 seconds
		Then I should see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active"
		Then I input "your works are excellent, thank you for submissions" to "Free text review" which is located at "//span[normalize-space()='Free text review']/../textarea" with xpath scroll
		Then I should not see "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']" with xpath
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
		Then I click on "Good" which is located at "//span[normalize-space()='Good']" with xpath scroll
		Then I input "your works are excellent, thank you for submissions" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I can see "step 3" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active"
		Then I click on "Choice 1" which is located at "//span[normalize-space()='Choice 1']" with xpath scroll
		Then I click on "Choice 0.4" which is located at "//span[normalize-space()='Choice 0.4']" with xpath scroll
		Then I input "your work is good" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
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