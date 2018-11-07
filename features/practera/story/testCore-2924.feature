Feature: Practera Hide Activities on Calendar
	As a program coordinator
	I don't want to see the skills on the calendar
    so that I can have cleaner calendar.

    Scenario: Test Practera Hide Activities on Calendar
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coor@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I should be able to see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
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
        Then "Practera" I log out
    
    Scenario: Test Practera Hide Activities on Calendar with another coordinator account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coordinator@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I should be able to see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I should be able to see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should be able to see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath assert
        Then "Practera" I log out
    
    Scenario: Test Practera Hide Activities on Calendar with the same coordinator
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coor@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I should be able to see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
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
        Then "Practera" I log out

    Scenario: Test Practera Hide Activities on Calendar with a participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "test_program_student_1@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "calendar" which is located at "//*[text()='Calendar']/.." with xpath
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
        Then "Practera" I log out

    Scenario: Test Practera Hide Activities on Calendar with the same participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "test_program_student_1@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "calendar" which is located at "//*[text()='Calendar']/.." with xpath
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
        Then "Practera" I log out