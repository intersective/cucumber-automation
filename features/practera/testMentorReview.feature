Feature: Practera Mentor Review
	As a program mentor
	I want to login to Practera platform
	so that I can review student submissions

    Scenario: Test Practera Mentor Review
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "selenium_mentor2@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(4) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "ul.nav li:nth-of-type(4) > ul > li > a"
		Then I should be able to see a group of "to review submission" which is located at "div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row" with assert
		Then "Practera" I can go to the review page with the student submission and the assessment "Comprehensive Moderated"
		Then I click on "the start button" which is located at "div#start-page > div.form-actions > button"
		Then I wait 2 seconds
		Then I should be able to see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active" with assert
		Then I input "your works are excellent, thank you for submissions" to "Free text review" which is located at "//span[normalize-space()='Free text review']/../textarea" with xpath scroll
		Then I input "your works are excellent, thank you for submissions" to "Reviwer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I should be able to see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
		Then I click on "Good" which is located at "//span[normalize-space()='Good']" with xpath scroll
		Then I input "your works are excellent, thank you for submissions" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I should be able to see "step 3" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active"
		Then I click on "Choice 1" which is located at "//span[normalize-space()='Choice 1']" with xpath scroll
		Then I click on "Choice 0.4" which is located at "//span[normalize-space()='Choice 0.4']" with xpath scroll
		Then I input "your work is good" to "Reviewer comments" which is located at "//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I should be able to see "step 4" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active"
		Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
		Then I wait 2 seconds
		Then I should be able to see "step 5" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(5).active"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "div#assessment-buttons button#submit" with scroll
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(2) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(2) > ul.user-menu > li:nth-of-type(4) > a"