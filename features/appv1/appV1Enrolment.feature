Feature: AppV1 enrolment
	As a program admin
	I want to enrol a student
	so that I can allow him to experience the program contents

	Scenario: Test AppV1 enrolment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
		Then I can see "a bar" which is located at "#sidebar"
		Then "Practera" I go to the "People" page
		Then I wait 2 seconds
		Then "Practera" I go to the "Enrolments" page
		Then I click on "add enrolments button" which is located at ".content-container .row:nth-of-type(1) a:nth-of-type(4)"
		Then I can see "a form" which is located at "#EnrolmentAdminAddForm"
		Then I select "App V1 timeline 1" to "a selector" which is located at "#EnrolmentAdminAddForm .timeline-select #EnrolmentTimelineId"
		Then I input 1 student enrolment information which is located at "textArea[name='data[Enrolment][csvtext]']"
		Then I wait 2 seconds
		Then "Practera" I click the enrolment save button
		Then I wait until the process percentage be 100 percent
		Then I wait 2 seconds
		Then I click on "a button" which is located at ".page-header a"
		Then I input student name to "the box" which is located at "#indextbl_filter input"
		Then I wait 2 seconds
		Then I wait the search result with locator "table#indextbl tbody tr"
		Then I click on "send invite" which is located at "table#indextbl tbody tr:nth-of-type(1) td:nth-of-type(2) a"
		Then I wait until the process percentage be 100 percent
		Then I wait 2 seconds
		Then "Practera" I log out

		Given I go to Mailtrap
		When "Mailtrap" I login with "mailtrapUser" and "mailtrapUserPassword"
		Then "Mailtrap" I go to practera inbox
		Then "Mailtrap" I search email with title "App V1 Selenium Program - Welcome and Register" and the student as receiver
		Then "Mailtrap" I go into the email content
		Then I get the registration url at "#btn_registration" for student 1
		Then "Mailtrap" I go back to previous frame
		Then I wait 2 seconds
        Then "Mailtrap" I log out