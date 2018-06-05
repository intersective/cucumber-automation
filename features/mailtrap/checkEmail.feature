Feature: Mailtrap check api enrolement email
	As a admin
	I want to stay notified by the student enrolement
	So that I can see how many students being enrolled

    Scenario: Test Mailtrap team email
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with receiver "selenium.20180605143200@practera.com" and filter "[ App V1 Selenium  ] You are now part of a team"
        Then I wait 2 seconds
        Then "Mailtrap" I log out

    Scenario: Test Mailtrap custom branding notification email
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with title "Custom Branding Changes" and receiver "help@practera.com"
        Then I wait 2 seconds
        Then "Mailtrap" I log out