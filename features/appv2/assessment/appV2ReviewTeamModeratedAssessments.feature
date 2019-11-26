Feature: AppV2 team moderated assessment review
	As a student in a team
	I want to login to the app and go to check a team assessment
	so that I can review the team submission

    Scenario: Test team member review team work
        Given I go to App V2
        When "Appv2" I login with the student2 account and password "#(studentPassword)"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Have you personally engaged with your mentor within the last two weeks?(participant)" and description "You should engage with your mentor at least once every fortnight."
        Then "Appv2" I can see the fast feedback question 2 with title "Do you feel that your team is on track (participant)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Yes" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback

        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Activity Three" activity
        Then "Appv2" I go to the assessment "Team Moderated"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the answer "good good" for question 1 with question type "text"
        Then "Appv2" I can see the answer "Normal" for question 2 with question type "multiple choice"
        Then "Appv2" I can see the answer "Choice 0.6,Choice 0.2" for question 3 with question type "checkbox"
        Then "Appv2" I go back from assessment page
        Then "Appv2" I log out
