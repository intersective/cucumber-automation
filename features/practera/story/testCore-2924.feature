Feature: Practera Hide Activities on Calendar
	As a program coordinator
	I don't want to see the skills on the calendar
    so that I can have cleaner calendar.

    Scenario: Test Practera Hide Activities on Calendar
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coor@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Project" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
        Then I wait 2 seconds
        Then I click on "Projects" which is located at "#sidebar ul.nav li:nth-of-type(2) .submenu > li:nth-of-type(1) > a"
        Then I wait 2 seconds
        Then I click on "cohorts tab" which is located at "a[href='#cohorts']"
        Then I should be able to see "test automation timeline" which is located at "//td[text()='test automation timeline']" with xpath
        Then I click on "the calendar" which is located at "//td[text()='test automation timeline']/../td[5]/div[1]/a[2]" with xpath
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"
    
    Scenario: Test Practera Hide Activities on Calendar with another coordinator account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coordinator@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Project" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
        Then I wait 2 seconds
        Then I click on "Projects" which is located at "#sidebar ul.nav li:nth-of-type(2) .submenu > li:nth-of-type(1) > a"
        Then I wait 2 seconds
        Then I click on "cohorts tab" which is located at "a[href='#cohorts']"
        Then I should be able to see "test automation timeline" which is located at "//td[text()='test automation timeline']" with xpath
        Then I click on "the calendar" which is located at "//td[text()='test automation timeline']/../td[5]/div[1]/a[2]" with xpath
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"
    
    Scenario: Test Practera Hide Activities on Calendar with the same coordinator
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coor@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Project" which is located at "#sidebar ul.nav li:nth-of-type(2) a"
        Then I wait 2 seconds
        Then I click on "Projects" which is located at "#sidebar ul.nav li:nth-of-type(2) .submenu > li:nth-of-type(1) > a"
        Then I wait 2 seconds
        Then I click on "cohorts tab" which is located at "a[href='#cohorts']"
        Then I should be able to see "test automation timeline" which is located at "//td[text()='test automation timeline']" with xpath
        Then I click on "the calendar" which is located at "//td[text()='test automation timeline']/../td[5]/div[1]/a[2]" with xpath
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"

    Scenario: Test Practera Hide Activities on Calendar with a participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "test_program_student_1@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Calendar" which is located at "#sidebar ul.nav li:nth-of-type(4) a"
        Then I wait 2 seconds
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I should be able to see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath assert
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "hidden activity" which is located at "input[value='activity']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should not see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"

    Scenario: Test Practera Hide Activities on Calendar with the same participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "test_program_student_1@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Calendar" which is located at "#sidebar ul.nav li:nth-of-type(4) a"
        Then I wait 2 seconds
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I should not see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath assert
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then I click on "hidden activity" which is located at "input[value='activity']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"