Feature: Personal Edge Student Activity result after reviewing
	As a student to the program
	I want to login to the app
	so that I can check my Activity result after I have received my submissions reviews

    Scenario: Test Personal Edge Student Activity result after reviewing
        Given I go to PE
        When "PE" I login with username "selenium.20180508013454@practera.com" and password "12341234"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "1" position with title "Creative Thinker"
        Then "PE" I can see an activity locating at "1" position with "4" tick
        Then "PE" I can see an activity locating at "1" position with "4" score
        Then "PE" I can see an activity locating at "2" position with title "Confident Communicator"
        Then "PE" I can see an activity locating at "2" position with "4" tick
        Then "PE" I can see an activity locating at "2" position with "4" score
        Then "PE" I can see an activity locating at "3" position with title "Ethical Leader"
        Then "PE" I can see an activity locating at "3" position with "4" tick
        Then "PE" I can see an activity locating at "3" position with "4" score
        Then "PE" I can see an activity locating at "4" position with title "Career Strategist"
        Then "PE" I can see an activity locating at "4" position with "4" tick
        Then "PE" I can see an activity locating at "4" position with "4" score
        Then "PE" I can see an activity locating at "5" position with title "Cross-Cultural Team Player"
        Then "PE" I can see an activity locating at "5" position with "4" tick
        Then "PE" I can see an activity locating at "5" position with "4" score
        Then "PE" I can see an activity locating at "6" position with title "Digital Citizen"
        Then "PE" I can see an activity locating at "6" position with "4" tick
        Then "PE" I can see an activity locating at "6" position with "4" score
        Then "PE" I can see an activity locating at "7" position with title "Newbie"
        Then "PE" I can see an activity locating at "7" position with "4" tick
        Then "PE" I can see an activity locating at "7" position with "4" score
        Then "PE" I can see score "4.00" on the grade field
        Then I wait 5 seconds
        Then "PE" I log out