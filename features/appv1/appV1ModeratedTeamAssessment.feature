Feature: AppV1 Moderated Team Assessment
	As a student in a team
	I want to login to the app and do something with moderated team Assessment
	so that I can work with my team mates
	
	Scenario: Test AppV1 Moderated Team Assessment
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student1" and password "studentPassword" and domain "practera.com"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "assessment"
		Then "Appv1" I go to the assessment locating at "1"
		Then I wait until the loading finished
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I do the text question locating at "1" with answer "This is the text from Selenium text automation"
		Then I wait 2 seconds
		Then "Appv1" I do the oneof question locating at "1" of group "2" with answer "Normal"
		Then I wait 2 seconds
		Then "Appv1" I do the multiple question locating at "1" of group "3" with answer "Choice 0.8,Choice 0.6"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a submit confirmation" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I should be able to see "a submission notification" which is located at ".popup"
		Then I wait 3 seconds
		Then I click on "the continue button" which is located at ".popup > .popup-buttons > button"
		Then I wait 3 seconds
		Then I should be able to see "a submission successful message" which is located at ".modal"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".modal button"
		Then I wait until the loading finished
		Then "Appv1" I can see the "Team Moderated" with status "Assessment pending review"
		Then "Appv1" I log out

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div> table > tbody > tr" with assert
		Then I click on "team moderated(team) unassigned" which is located at "//*[text()='Team Moderated (team)']/../../td[3]/a" with xpath
		Then I click on "review tab" which is located at "#assessTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I should be able to see a group of "unassigned submissions" which is located at "#tblUnassigned > tbody > tr"
		Then "Practera Team" I should see team student "student1" submission
		Then "Practera Team" I can assign a mentor "mentor2" to a team student "student1" submission
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then "Practera" I log out

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with "mentor2Account" and "mentor2AccountPassword"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "review and feedback tag" which is located at "//*[text()='Reviews & Feedback']/.." with xpath
		Then I wait 2 seconds
		Then I click on "my reviews tag" which is located at "//*[normalize-space()='My Reviews']/a" with xpath
		Then I should be able to see a group of "to review submission" which is located at "#toreview tbody tr" with assert
		Then "Practera Team" I can go to the review page with a team student "student1" submission and the assessment "Team Moderated (Team)"
		Then I click on "the start button" which is located at "//*[@id='start-page']/../*[contains(@class, 'form-actions')]/button" with xpath
		Then I wait 2 seconds
		Then I should see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active"
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
		Then "Practera" I log out

		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div> table > tbody > tr" with assert
		Then I click on "ready to publish on team moderated assessment" which is located at "//*[text()='Team Moderated (team)']/../../td[5]/a" with xpath
		Then I wait 2 seconds
		Then I should be able to see a group of "reviewed submissions" which is located at "#tblReady-to-publish > tbody > tr"
		Then "Practera Team" I should see team student "student1" ready to publish submission
		Then "Practera Team" I can publish a team student "student1" submission review
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then "Practera" I log out

		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student1" and password "studentPassword" and domain "practera.com"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "feedback"
		Then "Appv1" I can see the "Team Moderated" with status "Feedback available"
		Then "Appv1" I log out

		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student2" and password "studentPassword" and domain "practera.com"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team Moderated" and category "feedback"
		Then "Appv1" I can see the "Team Moderated" with status "Feedback available"
		Then "Appv1" I go to the assessment locating at "1"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
		Then I wait until the loading finished
		Then I click on "mark review as read button" which is located at "//*[text()='Mark review as read']/../../label" with xpath scroll
		Then "Appv1" I go back from assessment page
		Then "Appv1" I go to the "Home" tab page
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Three" activity page which has "1" items
		Then "Appv1" I go to the assessment locating at "1"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
		Then I should see "the review marked as read" which is located at "[ng-click='markAsDone()'][disabled='disabled']" with scroll
		When "Appv1" I go back from assessment page
		Then "Appv1" I log out