Feature: Mailtrap check api enrolement email
	As a admin
	I want to stay notified by the student enrolement
	So that I can see how many students being enrolled

    Scenario: Test Mailtrap api enrolement email
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with title "API Enrolment test - Welcome and Register" and receiver "participant4@practera.com"
        Then I wait 2 seconds
        Then "Mailtrap" I log out