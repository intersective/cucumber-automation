@Feature
Feature: Personal Edge Student Creative Thinker Activity
	As a student to the program
	I want to login to the app
	so that I can start to taking the first activity

    Scenario: Test Personal Edge Student Creative Thinker Activity
        Given I go to PE
        When "PE" I login with username "#(user)" and password "#(password1)"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "1" position with title "Creative Thinker"
        Then "PE" I can see an activity locating at "1" position with "0" tick
        Then "PE" I can see an activity locating at "1" position with "0" score
        Then "PE" I go to "1" activity
        Then "PE" I can see "0" submissions for "Creative Thinker" activity
        Then "PE" I can add a new submission
        Then "PE" I can see an assessment with title "CREATIVE THINKER"
        Then "PE" I can see an assessment with description "Please choose a meaningful title, write a STARL/P statement and attach relevant files. The better your submission is, the more points you will win!"
        Then "PE" I can see "4" question groups
        Then "PE" I can see "1" question group with title "SUBMISSION TITLE"
        Then "PE" I can see "1" question group with description "In order to highlight your experience, you need to give your submission a title. For example \"Volunteering for fund raising\" or \"Leading a team project\""
        Then "PE" I can see "2" question group with title "STARL/P STATEMENT"
        Then "PE" I can see "2" question group with description "The following structure is provided to guide students in reflecting and doing a pitch to employers: STARL/P"
        Then "PE" I can see "3" question group with title "FILE UPLOAD"
        Then "PE" I can see "4" question group with title "OTHER FILES"
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then "PE" I can see an assessment with title "SUBMISSION TITLE" in the assessment detail page
        Then "PE" I can see an assessment with description "In order to highlight your experience, you need to give your submission a title. For example \"Volunteering for fund raising\" or \"Leading a team project\"" in the assessment detail page
        Then I will see a group of "questions" with total "1" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | text | What is the title of your experience? | I am really into the assessment part |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can go to "2" question group
        Then I wait 2 seconds
        Then "PE" I can see an assessment with title "STARL/P STATEMENT" in the assessment detail page
        Then "PE" I can see an assessment with description "The following structure is provided to guide students in reflecting and doing a pitch to employers: STARL/P" in the assessment detail page
        Then I will see a group of "questions" with total "5" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | text | Situation | I am really into the assessment part |
            | text | Task | I am really into the assessment part |
            | text | Action | I am really into the assessment part |
            | text | Result | I am really into the assessment part |
            | text | Learn / Plan | I am really into the assessment part |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can go to "3" question group
        Then I wait 2 seconds
        Then "PE" I can see an assessment with title "FILE UPLOAD" in the assessment detail page
        Then I will see a group of "questions" with total "1" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | file | File upload | medium-size-dogs-a-medium.jpg |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then I click on "back button" which is located at "assessments-page ion-header ion-navbar.toolbar button.back-button"
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then I click on "back button" which is located at "ion-header.activity-detail ion-navbar.toolbar button.back-button"
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then "PE" I go to "1" activity
        Then "PE" I can see "1" submissions for "Creative Thinker" activity
        Then "PE" I go to the in progress submission
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can see "4" question groups
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then I will see a group of "questions" with total "1" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | text | What is the title of your experience? | I am really into the assessment part |
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