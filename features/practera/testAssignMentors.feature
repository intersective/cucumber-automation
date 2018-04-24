Feature: Practera Assign reviewers
	As a program admin
	I want to login to Practera platform
	so that I can assign a mentor to review the assessments from students

    Scenario: Test Practera Assign reviewers
		Given I go to "https://sandbox.practera.com"
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(2) ul.submenu li:nth-of-type(3)"
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr" with assert
		Then I click on "moderated assessment" which is located at ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(1) td:nth-of-type(3) > a"
		Then I click on "review tab" which is located at "#reviewContainer > div#assessments > ul#reviewTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I should be able to see a group of "unassigned submissions" which is located at "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr"
		Then "Practera" I should see the student submission
		Then "Practera" I can assign a mentor "selenium_mentor2" to the student submission
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"