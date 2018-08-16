Feature: Mailtrap check emails
	As a admin
	I want to stay notified by the emails
	So that I can see where I am up to and what I need to do afterwards

    Scenario: Test Mailtrap team email
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with receiver "selenium.20180703232357@practera.com" and filter "[ App V1 Selenium  ] You are now part of a team"
        Then "Mailtrap" I go into the email content
        Then "Mailtrap" I can see "Hi selenium.20180703232357," in the email content
        Then "Mailtrap" I go back to previous frame
        Then I wait 2 seconds
        Then "Mailtrap" I log out

    Scenario: Test Mailtrap custom branding notification email
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with title "Custom Branding Changes" and receiver "help@practera.com"
        Then I wait 2 seconds
        Then "Mailtrap" I log out