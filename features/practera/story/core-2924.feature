@Feature
Feature: Practera Hide Activities on Calendar
	As a program coordinator
	I don't want to see the skills on the calendar
    so that I can have cleaner calendar.

    Scenario: Test Practera Hide Activities on Calendar
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(testprogram1CoorAccount)" and password "#(testprogram1CoorAccountPassword)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I can see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I can see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then "Practera" I log out
    
    Scenario: Test Practera Hide Activities on Calendar with another coordinator account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(testprogram1Coor2Account)" and password "#(testprogram1Coor2AccountPassword)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I can see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I can see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then "Practera" I log out
    
    Scenario: Test Practera Hide Activities on Calendar with the same coordinator
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(testprogram1CoorAccount)" and password "#(testprogram1CoorAccountPassword)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then I click on "Switch cohort" which is located at "//*[normalize-space()='Switch Cohort'][@class='select2-offscreen']/.." with xpath
		Then I select "test automation timeline" to "cohort" which is located at "select[data-placeholder='choose a timeline']"
        # Then I can see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I can see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I click on "today button" which is located at "div#calendar button.fc-today-button"
        Then "Practera" I wait for spinner loading finished
        Then I should see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then "Practera" I log out

    Scenario: Test Practera Hide Activities on Calendar with a participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then "Practera" I go to the "Calendar" page
        Then I wait 2 seconds
        Then I can see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I should see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I should see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I click on "hidden activity" which is located at "input[value='activity']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should not see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath
        Then "Practera" I log out

    Scenario: Test Practera Hide Activities on Calendar with the same participant account
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then "Practera" I go to the "Calendar" page
        Then I wait 2 seconds
        Then I can see "the calenar" which is located at "#calendar"
        Then "Practera" I wait for spinner loading finished
        Then I should not see "a milestone" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I should not see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath
        Then I click on "hidden milestone" which is located at "input[value='milestone']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should see a group of "milestones" which is located at "//span[text()='barry test milestone 1']" with xpath
        Then I click on "hidden activity" which is located at "input[value='activity']"
        Then "Practera" I wait the event toggler spinner disappear
        Then "Practera" I wait for spinner loading finished
        Then I should see "an activity" which is located at "//span[text()='barry test activity 1']" with xpath
        Then "Practera" I log out