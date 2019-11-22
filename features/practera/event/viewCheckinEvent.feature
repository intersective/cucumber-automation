Feature: Review an event check-ion in the app
	As a participant
	I want to review the check-in assessment of an event
	so that I can review the things I have done at the event

    Scenario: Test Check in an event in the app
        Given I go to App V2
        When "Appv2" I login with the student account and password "#(studentPassword)"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Then I click on "calendar" which is located at "//ion-icon[@name='calendar']" with xpath
        Then I can see "Events" which is located at "//*[normalize-space()='Events']" with xpath
        When "Appv2 events" I go to "Attended"
        Then "Appv2 events" I view the check-in of the event with:
            | answer | question number | question type |
            | New Choice 1 | 1 | multiple choice |
            | ohhh gogoggoo | 2 | text |
            | New Choice 1,New Choice 0 | 3 | checkbox |
        Then "Appv2 events" I go back
        Then "Appv2" I log out