Feature: AppV2 enrolment
	As a program admin
	I want to enrol a student
	so that I can allow him to experience the program contents

	Scenario: Test AppV2 enrolment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with "programv2AdminAccount" and "programAdminPassword"
		Then I can see "a bar" which is located at "#sidebar"
		Then "Practera" I go to the "People" page
		Then I wait 2 seconds
		Then "Practera" I go to the "Enrolments" page
		Then I click on "add enrolments button" which is located at ".content-container .row:nth-of-type(1) a:nth-of-type(4)"
		Then I can see "a form" which is located at "#EnrolmentAdminAddForm"
		Then I select "automation timeline" to "a selector" which is located at "#EnrolmentAdminAddForm .timeline-select #EnrolmentTimelineId"
		Then I input 1 student enrolment information which is located at "textArea[name='data[Enrolment][csvtext]']"
		Then I wait 2 seconds
		Then "Practera" I click the enrolment save button
		Then I wait until the process percentage be 100 percent
		Then I wait 2 seconds
		Then I click on "a button" which is located at ".page-header a"
		Then I get the registration url at "table#indextbl tbody tr:nth-of-type(1) td:nth-of-type(5) a:nth-of-type(1)" for 1 student
		Then "Practera" I log out