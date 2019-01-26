@Feature
Feature: Personal Edge Student Ethical Leader Activity
	As a student to the program
	I want to login to the app
	so that I can start to taking the third activity

    Scenario: Test Personal Edge Student Personal Edge Student Ethical Leader Activity
        Given I go to PE
        When "PE" I login with username "#(user)" and password "#(password1)"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "3" position with title "Ethical Leader"
        Then "PE" I go to "3" activity
        Then "PE" I can see "1" submissions for "Ethical Leader" activity
        Then "PE" I can add a new submission
        Then "PE" I can see "4" question groups
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then I will see a group of "questions" with total "1" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | text | What is the title of your experience? | I am really into the Ethical Leader part |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can go to "2" question group
        Then I wait 2 seconds
        Then I will see a group of "questions" with total "5" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | text | Situation | I am really into the Ethical Leader part |
            | text | Task | I am really into the Ethical Leader part |
            | text | Action | I am really into the Ethical Leader part |
            | text | Result | I am really into the Ethical Leader part |
            | text | Learn / Plan | I am really into the Ethical Leader part |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can go to "3" question group
        Then I wait 2 seconds
        Then I will see a group of "questions" with total "1" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | file | File upload | rc.jpg |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then I click on "submit button" which is located at "assessments-page ion-header ion-navbar.toolbar button.btn-submit"
        Then I can see "a dialog" which is located at "ion-alert[role=dialog]"
        Then I wait 2 seconds
        Then I click on "confirm button" which is located at "ion-alert[role=dialog] .alert-wrapper .alert-button-group button:nth-of-type(1)"
        Then "PE" I wait for loading finished
        Then I wait 3 seconds
        Then I click on "done button" which is located at "div.modal-wrapper ion-list.items-popup-data button"
        Then "PE" I wait for loading finished
        Then I wait 5 seconds
        Then "PE" I log out