Feature: AppV1 Moderated Team Assessment
	As a student in a team
	I want to login to the app and do something with moderated team Assessment
	so that I can work with my team mates
	
	Scenario: Test AppV1 Moderated Team Assessment
		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with username "selenium.20180619103038@practera.com" and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "assessment"
		Then "Appv1" I go to the assessment locating at "1"
		Then I wait until the loading finished
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I do the text question locating at "1" with answer "This is the text from Selenium text automation"
		Then I wait 2 seconds
		Then "Appv1" I do the oneof question locating at "2" with answer "2"
		Then I wait 2 seconds
		Then "Appv1" I do the multiple question locating at "3" with answer "2,3"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a pop up" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".popup> .popup-buttons > button"
		Then I wait 2 seconds
		Then I click on "the pop up button" which is located at ".modal button"
		Then I wait until the loading finished
		Then "Appv1" I can see the "Team Moderated" with status "Assessment pending review"
		Then "Appv1" I log out

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
		Then I wait 3 seconds
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) ul.submenu li:nth-of-type(3)"
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr" with assert
		Then I click on "team moderated(team)" which is located at ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(2) td:nth-of-type(3) > a"
		Then I click on "review tab" which is located at "#reviewContainer > div#assessments > ul#reviewTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I should be able to see a group of "unassigned submissions" which is located at "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr"
		Then "Practera" I should see a student "Team 30 (selenium.20180619103038)" submission
		Then "Practera" I can assign a mentor "selenium_mentor2" to a student "Team 30 (selenium.20180619103038)" submission
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "selenium_mentor2@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(4) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "ul.nav li:nth-of-type(4) > ul > li > a"
		Then I should be able to see a group of "to review submission" which is located at "div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row" with assert
		Then "Practera" I can go to the review page with a student "Team 30 ( selenium.20180619103038 )" submission and the assessment "Team Moderated"
		Then I click on "the start button" which is located at "div#start-page > div.form-actions > button"
		Then I wait 2 seconds
		Then I should be able to see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active" with assert
		Then I input "your works are excellent, thank you for submissions" to "Free text review" which is located at "//span[normalize-space()='Free text review']/../textarea" with xpath scroll
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
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "div#assessment-buttons button#submit" with scroll
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(2) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(2) > ul.user-menu > li:nth-of-type(4) > a"

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) ul.submenu li:nth-of-type(3)"
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr" with assert
		Then I click on "ready to publish on moderated assessment" which is located at ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(2) td:nth-of-type(5) > a"
		Then I wait 2 seconds
		Then I should be able to see a group of "reviewed submissions" which is located at "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr"
		Then "Practera" I should see a student "Team 30 (selenium.20180619103038)" ready to publish submission
		Then "Practera" I can publish a student "Team 30 (selenium.20180619103038)" submission review
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"

		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with username "selenium.20180619103038@practera.com" and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "assessment"
		Then "Appv1" I can see the "Team Moderated" with status "Assessment published"
		Then "Appv1" I log out

		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with username "selenium.20180619113736@practera.com" and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "assessment"
		Then "Appv1" I can see the "Team Moderated" with status "Assessment published"
		Then "Appv1" I log out