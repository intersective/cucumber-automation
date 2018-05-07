Feature: Personal Edge Student After Newbie Activity
	As a student to the program
	I want to login to the app
	so that I can see the result of Newbie activity

    Scenario: Test Personal Edge Student After Newbie Activity
        Given I go to PE
        When "PE" I login with username "selenium.20180507221857@practera.com" and password "12341234"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "7" position with title "Newbie"
        Then "PE" I can see an activity locating at "7" position with "4" tick
        Then "PE" I can see an activity locating at "7" position with "4" score
        Then I wait 5 seconds
        Then "PE" I log out