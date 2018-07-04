Feature: Mailtrap check emails
	As a admin
	I want to stay notified by the emails
	So that I can see where I am up to and what I need to do afterwards

    Scenario: Test Mailtrap team email with Mailtrap Api
        Given "Mailtrap Api" I search email with "receiver" "selenium.20180703232357@practera.com" and "title" "[ App V1 Selenium  ] You are now part of a team" with "10" tries
        Then "Mailtrap Api" I can see "You have been added to a team. Your team name is Team 35. Log in to see your team members!" in the email content
        Then "Mailtrap Api" I can see "Hi selenium.20180703232357," in the email content
        When "Mailtrap Api" I search email with "title" "Custom Branding Changes" and "receiver" "help@practera.com" with "10" tries
        Then "Mailtrap Api" I can see "Color: \"#113d91\"" in the email content