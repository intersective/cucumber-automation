Feature: Personal Edge Newbie
	As a new student to the program
	I want to login to the app
	so that I can start doing the new bie assessment

    Scenario: Test Personal Edge Newbie
        Given I go to PE
        When "PE" I login with "user" and "password1"
        Then "PE" I wait for loading finished
        Then "PE" I can see an activity locating at "1" position with title "Newbie"
        Then "PE" I can see an activity locating at "1" position with "0" tick
        Then "PE" I can see an activity locating at "1" position with "0" score
        Then "PE" I go to "1" activity
        Then "PE" I can see "0" submissions for "Newbie" activity
        Then "PE" I can add a new submission
        Then "PE" I can see an assessment with title "PERSONAL EDGE PRE-PROGRAM QUESTIONNAIRE"
        Then "PE" I can see an assessment with description "This is a self-assessment exercise about employability skills. Take the time to reflect on the skills you have:"
        Then "PE" I can see "1" question groups
        Then "PE" I can see "1" question group with title "MY SELF-ASSESSMENT"
        Then "PE" I can see "1" question group with description "This is a self-assessment exercise about employability skills. Take the time to reflect on the skills you currently have:"
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then "PE" I can see an assessment with title "MY SELF-ASSESSMENT" in the assessment detail page
        Then "PE" I can see an assessment with description "This is a self-assessment exercise about employability skills. Take the time to reflect on the skills you currently have:" in the assessment detail page 
        Then I can see a group of "questions" with total "28" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | oneof | I can generate a lot of new ideas to approach a challenge | Strongly agree |
            | oneof | I can see opportunities in the marketplace and generate entrepreneurial ideas | Strongly agree |
            | oneof | I can screen and select the best ideas for the situation | Strongly agree |
            | oneof | I can easily make a plan to implement my ideas | Strongly agree |
            | oneof | I can communicate effectively through social media | Strongly agree |
            | oneof | I can deliver a presentation to a large audience | Strongly agree |
            | oneof | I can chair a small group meeting to achieve a goal | Strongly agree |
            | oneof | My peers give good feedbacks about my speaking and writing skill | Strongly agree |
            | oneof | I know what my values and beliefs are and I would not compromise | Agree |
            | oneof | I can encourage other people I work with | Strongly agree |
            | oneof | I can craft and communicate a vision of what I want to achieve with other people | Strongly agree |
            | oneof | I am not afraid to challenge the status quo and bring up innovations | Strongly agree |
            | oneof | I can work with others to generate ideas to approach a challenge | Strongly agree |
            | oneof | I am comfortable working with people from different cultures | Strongly agree |
            | oneof | I can adapt to the specific culture of a new group or organisation | Strongly agree |
            | oneof | I have respect for other people's differences | Strongly agree |
            | oneof | I know how to present myself professionally to future employers and business partners | Strongly agree |
            | oneof | I know how to network professionally | Strongly agree |
            | oneof | When looking for a job or business opportunities, I know which channels I should explore | Strongly agree |
            | oneof | I know how to create an appealing resume and LinkedIn profile | Strongly agree |
            | oneof | I know how to use quality, credible and relevant sources to support and develop ideas | Strongly agree |
            | oneof | I know and respect with ethical and legal aspects of using published and unpublished information | Strongly agree |
            | oneof | I know how to participate in online discussions, contributing via social media, professional, industry and open forums. | Strongly agree |
            | oneof | I know how to manage personal and professional online identities. | Strongly agree |
            | text | What is your expectation when participating in Personal Edge? Feedback on any parts of the program will be greatly appreciated | I am really into the assessment part |
            | text | What are additional topics you would like to cover in the program? | really good |
            | oneof | How prepared do you feel to promote yourself to a future employer? | Very prepared |
            | oneof | How clear are your career objectives now? | Clear |
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
        Then "PE" I can see "1" submissions for "Newbie" activity
        Then "PE" I go to the in progress submission
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can see "1" question groups
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then I can see a group of "questions" with total "28" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the "oneof" question which is located at "2" with title "I can see opportunities in the marketplace and generate entrepreneurial ideas" and answer "Agree"
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