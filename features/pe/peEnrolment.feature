Feature: Personal Edge Enrolment
	As a program admin
	I want to enrol students
	so that I can allow them to experience the program contents

	Scenario: Test Personal Edge Enrolment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with username "#(peprogramAdminAccount)" and password "#(peprogramAdminAccountPassword)"
		Then I can see "a bar" which is located at "#sidebar"
		Then "Practera" I go to the "People" page
		Then I wait 2 seconds
		Then "Practera" I go to the "Enrolments" page
		Then I click on "add enrolments button" which is located at ".content-container .row:nth-of-type(1) a:nth-of-type(4)"
		Then I can see "a form" which is located at "#EnrolmentAdminAddForm"
		Then I select "Automation Timeline" to "a selector" which is located at "#EnrolmentAdminAddForm .timeline-select #EnrolmentTimelineId"
		Then "PE" I input the enrolment information which is located at "input#fileupload[name='data[Enrolment][upload]']"
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