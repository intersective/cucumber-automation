Feature: Personal Edge Student Portfolio
	As a student to the program
	I want to login to the app
	so that I can request my studen portfolio

    Scenario: Test Personal Edge Student Portfolio
        Given I go to PE
        When "PE" I login with username "selenium.20180508013454@practera.com" and a predefined password "password1"
        Then "PE" I wait for loading finished
        Then I click on "Request Portfolio" which is located at ".dashboard-data > li:nth-of-type(3) .number > .badge"
        Then I should be able to see "confirm window" which is located at "ion-action-sheet .action-sheet-container"
        Then I click on "cancel button" which is located at "ion-action-sheet .action-sheet-container .action-sheet-group:nth-of-type(2) > button"
        Then The "confirm window" which is located at "ion-action-sheet .action-sheet-container" should be disappear
        Then I click on "Request Portfolio" which is located at ".dashboard-data > li:nth-of-type(3) .number > .badge"
        Then I should be able to see "confirm window" which is located at "ion-action-sheet .action-sheet-container"
        Then I click on "confirm button" which is located at "ion-action-sheet .action-sheet-container .action-sheet-group:nth-of-type(1) > button"
        Then I wait 3 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can see an assessment with title "PERSONAL EDGE POST-PROGRAM QUESTIONNAIRE"
        Then "PE" I can see an assessment with description "Congratulations on completing Personal Edge! Please take 5 minutes to help us understand how you feel about your future career."
        Then "PE" I can see "2" question groups
        Then "PE" I can see "1" question group with title "MY SELF-ASSESSMENT"
        Then "PE" I can see "2" question group with title "RATE & FEEDBACK"
        Then "PE" I can see "2" question group with description "Please share your feedback on the overall program"
        Then "PE" I can go to "1" question group
        Then I wait 2 seconds
        Then I can see a group of "questions" with total "26" which is located at ".groups-question div.assessments-group-text"
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
            | oneof | I know what my values and beliefs are and I would not compromise | Strongly agree |
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
            | oneof | How prepared do you feel to promote yourself to a future employer after finishing the program? | Very prepared |
            | oneof | How clear are your career objectives now? | Very clear |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can go to "2" question group
        Then I wait 2 seconds
        Then I can see a group of "questions" with total "9" which is located at ".groups-question div.assessments-group-text"
        Then "PE" I do the questions with:
            | questionType | questionTitle | questionAnswer |
            | oneof | The format (registration/ workshop/ evidence submission) of the program was understandable | Strongly agree |
            | oneof | The student volunteers were supportive and helpful | Strongly agree |
            | oneof | The staff put a lot of time into commenting on my work | Strongly agree |
            | oneof | Students’ ideas and suggestions were used during the program | Strongly agree |
            | oneof | I consider what I learned valuable for my future employability | Strongly agree |
            | oneof | The program has made me more interested in future learning | Strongly agree |
            | text | What were the best aspects of the Personal Edge program? | I am really into the assessment part |
            | text | What aspects of the program were most in need of improvement? | I am really into the assessment part |
            | text | What are additional topics you would like to cover in the program? | I am really into the assessment part |
        Then I wait 2 seconds
        Then I click on "save button" which is located at "assessments-group-page ion-navbar.toolbar ion-buttons button.btn-save"
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I wait for loading finished
        Then I wait 2 seconds
        Then "PE" I can see "2" question groups
        Then I click on "submit button" which is located at "assessments-page ion-header ion-navbar.toolbar button.btn-submit"
        Then I should be able to see "a dialog" which is located at "ion-alert[role=dialog]"
        Then I wait 2 seconds
        Then I click on "YES" which is located at "ion-alert[role=dialog] .alert-wrapper .alert-button-group button:nth-of-type(1)"
        Then "PE" I wait for loading finished
        Then I wait 3 seconds
        Then I should be able to see "a dialog" which is located at "ion-alert[role=dialog]"
        Then I wait 2 seconds
        Then I click on "OK" which is located at "ion-alert[role=dialog] .alert-wrapper .alert-button-group button:nth-of-type(1)"
        Then "PE" I wait for loading finished
        Then I wait 5 seconds
        Then "PE" I log out