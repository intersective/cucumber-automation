Feature: Personal Edge Enrolment
	As a program admin
	I want to enrol students
	so that I can allow them to experience the program contents

	Scenario: Test Personal Edge Enrolment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
		Then "Practera" I login with username "pe_admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a bar" which is located at "#sidebar"
		Then I click on "people tab button" which is located at "//*[text()='People']/.." with xpath
		Then I wait 2 seconds
		Then I click on "program enrolments tab" which is located at "//*[text()='People']/../..//*[normalize-space()='Program Enrolments']" with xpath
		Then I click on "add enrolments button" which is located at ".content-container .row:nth-of-type(1) a:nth-of-type(4)"
		Then I should be able to see "a form" which is located at "#EnrolmentAddForm"
		Then I select "Automation Timeline" to "a selector" which is located at "#EnrolmentAddForm .timeline-select #EnrolmentTimelineId"
		Then "PE" I input the enrolment information which is located at "input#fileupload[name='data[Enrolment][upload]']"
		Then I wait 2 seconds 
		Then I click on "a button" which is located at "#EnrolmentAddForm .form-actions button"
		Then I wait until the enrolment process percentage be 100 percent
		Then I wait 2 seconds
		Then I click on "a button" which is located at ".page-header a"
		Then I input student name to "the box" which is located at "#indextbl_filter input"
		Then I wait 2 seconds
		Then I wait the search result with locator "table#indextbl tbody tr"
		Then I click on "send invite" which is located at "table#indextbl tbody tr:nth-of-type(1) td:nth-of-type(8) > div > a:nth-of-type(3)"
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then "Practera" I log out