Feature: AppV2 assessment review and feedback
	As a student
	I want to login to the app and check the feedback from the reviewers
	so that I can improve my work

    Scenario: Test AppV2 assessment review and feedback
        Given I go to App V2
        When "Appv2" I login with the student account and password "studentPassword"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Then I should see "feedback notification" which is located at "//app-todo-card/ion-card//*[normalize-space()='Comprehensive Moderated']" with xpath
        When I click on "the notification" which is located at "//app-todo-card/ion-card//*[normalize-space()='Comprehensive Moderated']/../.." with xpath
        Then "Appv2" I wait for loading finished
        Then "Appv2 Reviews" I can see the "text" question 1 feedback with:
            | mentor good |
            | mentor good comment |
        Then "Appv2 Reviews" I can see the "multiple choice" question 2 feedback with:
            | Good |
            | mentor good comment |
        Then "Appv2 Reviews" I can see the "checkbox" question 3 feedback with:
            | Choice 1,Choice 0.6 |
            | mentor good comment |
        When "Appv2 Reviews" I mark the feedback as read
        Then "Appv2 Reviews" I see the rating pop up
        Then "Appv2 Reviews" I move the rating slider by 5 times
        Then "Appv2 Reviews" I choose "You are awesome!" to quick response
        Then "Appv2 Reviews" I add "good good" to personal comments
        Then "Appv2 Reviews" I submit the review rating
        Then I should see "Assessment" which is located at "//ion-title[normalize-space()='Assessment']" with xpath
        Then "Appv2" I go back from assessment page
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Have you personally engaged with your mentor within the last two weeks?(participant)" and description "You should engage with your mentor at least once every fortnight."
        Then "Appv2" I can see the fast feedback question 2 with title "Do you feel that your team is on track (participant)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Yes" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback
        Then "Appv2" I go to the "Home" tab page
        Then "Appv2" I can see progress 15
        Then "Appv2" I log out