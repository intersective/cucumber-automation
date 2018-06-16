Feature: Practera add a team
	As a program admin
	I want to group students into different teams
	so that they can participate in team assessments

    Scenario: Test Practera add a team
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(4) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(4) ul.submenu li:nth-of-type(2)"
		Then I should be able to see a group of "team lists" which is located at "#indextbl > tbody > tr"
		Then I click on "add team button" which is located at ".page-header a"
		Then I should be able to see "add team form" which is located at "#TeamAdminAddForm"
		Then I input "selenium.20180616103404" to "Team memebers" which is located at "#TeamAdminAddForm > .form-group:nth-of-type(4) input[type='text']"		
		Then I click on "the team member" which is located at "//*[@class='select2-match'][text()='selenium.20180616103404']" with xpath
		Then I wait 2 seconds
		Then I input "selenium.20180616104756" to "Team memebers" which is located at "#TeamAdminAddForm > .form-group:nth-of-type(4) input[type='text']"		
		Then I click on "the team member" which is located at "//*[@class='select2-match'][text()='selenium.20180616104756']" with xpath
		Then I wait 2 seconds
		Then I click on "save button" which is located at "#TeamAdminAddForm > .form-actions button:nth-of-type(1)"
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"