@Feature
Feature: Personal Edge Student Activity result for one submission
	As a new student to the program
	I want to login to the app
	so that I can check my Activity result after I have done one submission for each activity

    Scenario: Test Personal Edge Student Activity result for one submission
        Given I go to PE
        When "PE" I login with "user" and "password1"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "1" position with title "Creative Thinker"
        Then "PE" I can see an activity locating at "1" position with "1" tick
        Then "PE" I can see an activity locating at "1" position with "0" score
        Then "PE" I can see an activity locating at "2" position with title "Confident Communicator"
        Then "PE" I can see an activity locating at "2" position with "1" tick
        Then "PE" I can see an activity locating at "2" position with "0" score
        Then "PE" I can see an activity locating at "3" position with title "Ethical Leader"
        Then "PE" I can see an activity locating at "3" position with "1" tick
        Then "PE" I can see an activity locating at "3" position with "0" score
        Then "PE" I can see an activity locating at "4" position with title "Career Strategist"
        Then "PE" I can see an activity locating at "4" position with "1" tick
        Then "PE" I can see an activity locating at "4" position with "0" score
        Then "PE" I can see an activity locating at "5" position with title "Cross-Cultural Team Player"
        Then "PE" I can see an activity locating at "5" position with "1" tick
        Then "PE" I can see an activity locating at "5" position with "0" score
        Then "PE" I can see an activity locating at "6" position with title "Digital Citizen"
        Then "PE" I can see an activity locating at "6" position with "1" tick
        Then "PE" I can see an activity locating at "6" position with "0" score
        Then "PE" I can see an activity locating at "7" position with title "Newbie"
        Then "PE" I can see an activity locating at "7" position with "4" tick
        Then "PE" I can see an activity locating at "7" position with "4" score
        Then I wait 5 seconds
        Then "PE" I log out