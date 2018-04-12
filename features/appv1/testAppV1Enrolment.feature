Feature: AppV1 Enrolment
	As a program admin
	I want to enrol students
	so that I can allow them to experience the program contents

	Scenario: Test AppV1 Enrolment Scenario
		Given I go to "https://sandbox.practera.com"
		When The "message" which is located at ".toast-message" should be disappear
		Then I click on "a button" which is located at "#main-nav > ul.nav > li:nth-of-type(2) > a"
		Then I should be able to see "a form" which is located at "form#login"
		Then I input "admin_selenium@practera.com" to "email input field" which is located at "form#login input#UserEmail"
		Then I input "12341234" to "password input field" which is located at "form#login input#UserPassword"
		Then I click on "a button" which is located at "form#login button"
		Then I should be able to see "message" which is located at ".toast-message"
		When The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then I should be able to see "a bar" which is located at "#sidebar"
		Then I click on "a button" which is located at "#sidebar ul.nav li.hsub:nth-of-type(4) a"
		Then I wait 2 seconds
		Then I click on "a menu" which is located at "#sidebar ul.nav li.hsub:nth-of-type(4) ul.submenu li:nth-of-type(1)"
		Then I click on "a menu" which is located at ".content-container .row:nth-of-type(1) a:nth-of-type(4)"
		Then I should be able to see "a form" which is located at "#EnrolmentAddForm"
		Then I select "App V1 timeline 1" to "a selector" which is located at "#EnrolmentAddForm .timeline-select #EnrolmentTimelineId"
		Then I input the enrolment information which is located at "textArea[name='data[Enrolment][csvtext]']"
		Then I wait 2 seconds 
		Then I click on "a button" which is located at "#EnrolmentAddForm .form-actions button"
		Then I wait until the enrolment process percentage be 100 percent
		Then I wait 2 seconds
		Then I click on "a button" which is located at ".page-header a"
		Then I input student name to "the box" which is located at "#indextbl_filter input"
		Then I wait 2 seconds
		Then I wait the search result
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"