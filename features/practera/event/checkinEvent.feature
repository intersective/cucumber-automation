Feature: Check in an event in the app
	As a participant
	I want to do the checkin assessment of an event
	so that I can give some feedback on the events

    Scenario: Test Check in an event in the app
        Given I go to App V2
        When "Appv2" I login with the student account and password "#(studentPassword)"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Then I click on "calendar" which is located at "//ion-icon[@name='calendar']" with xpath
        Then I can see "Events" which is located at "//*[normalize-space()='Events']" with xpath
        When "Appv2 events" I go to "Attended"
        Then "Appv2 events" I can see the event
        Then "Appv2 events" I do the checkin assessment of the event
        Then "Appv2 events" I go back
        Then "Appv2" I log out