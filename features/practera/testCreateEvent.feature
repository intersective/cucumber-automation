Feature: Practera create an event in a timeline
	As a program admin
	I want to have an event during a specfic of time
	so that the students can participate in the event

    Scenario: Test ractera create an event in a timeline
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "pe_admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(2) a"
		Then I wait 2 seconds
		Then I click on "li tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(2) ul.submenu li:nth-of-type(1)"
		Then I click on "cohorts tab" which is located at "#projectTab > li:nth-of-type(2) > a"
		Then I wait 2 seconds
		Then I should be able to see a group of "timelines" which is located at "table#tblTimeline tbody tr"
		Then "Practera" I can choose a timeline "Automation Timeline" calendar
		Then I click on "today button" which is located at "div#calendar button.fc-today-button"
		Then I wait 2 seconds
		Then "Practera" I can create an event today
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"