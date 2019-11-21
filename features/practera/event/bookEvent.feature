Feature: Book an event in the app
	As a participant
	I want to attend an event during a specfic of time
	so that I can experience the event

    Scenario: Test Book an event in the app
        Given I go to App V2
        When "Appv2" I login with the student account and password "#(studentPassword)"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Comprehensive Activity" activity
        Then "Appv2 activity" I can see the event
        When  "Appv2" I go to the "Home" tab page
        Then "Appv2" I wait for loading finished
        Then I click on "calendar" which is located at "//ion-icon[@name='calendar']" with xpath
        Then I can see "Events" which is located at "//*[normalize-space()='Events']" with xpath
        Then "Appv2 events" I can see the event
        Then "Appv2 events" I book the event
        When "Appv2 events" I go to "Booked"
        Then "Appv2 events" I can see the event
        Then "Appv2 events" I go back
        When "Appv2" I wait for loading finished
        Then "Appv2" I log out