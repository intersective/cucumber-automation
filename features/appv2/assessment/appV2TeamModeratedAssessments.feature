Feature: AppV2 team moderated assessment
	As a student in a team
	I want to login to the app and submit the assessment
	so that mentor and my team mates can review my work

    Scenario: Test AppV2 team moderated assessment
        Given I go to App V2
        When "Appv2" I login with the student account and password "studentPassword"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Activity Three" activity
        Then "Appv2" I go to the assessment "Team Moderated"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the assessment with name "Team Moderated" and description "This is a team moderated assessment"
        Then "Appv2" I can see question group 1 name "Text Questions" and description "Comprehensive Moderated Text Questions Group description"
        Then "Appv2" I can see question 1 name "Text Question 1" and description "this is text question 1 description"
        Then "Appv2" I answer "good good" for question 1 with question type "text"
        Then "Appv2" I can see question group 2 name "Oneof Questions" and description "Comprehensive Moderated Oneof Questions Group description"
        Then "Appv2" I can see question 2 name "Oneof Question 1" and description "this is text Oneof Question 1 description"
        Then "Appv2" I click the question 2 choices descriptions button
        Then "Appv2" I can see the question 2 choices descriptions with:
            | Good - Good choice description |
            | Normal - Normal choice description |
            | Bad - Bad choice description |
        Then "Appv2" I answer "Normal" for question 2 with question type "multiple choice"
        Then "Appv2" I can see question group 3 name "Multiple Choice Questions" and description "Comprehensive Moderated checkbox Questions Group description"
        Then "Appv2" I can see question 3 name "Multiple Choice Question 1" and description "Comprehensive Moderated checkbox Question 1 description"
        Then "Appv2" I click the question 3 choices descriptions button
        Then "Appv2" I can see the question 3 choices descriptions with:
            | Choice 1 - Choice 1 description |
            | Choice 0.8 - Choice 0.8 description |
            | Choice 0.6 - Choice 0.6 description |
            | Choice 0.4 - Choice 0.4 description |
            | Choice 0.2 - Choice 0.2 description |
        Then "Appv2" I answer "Choice 0.6,Choice 0.2" for question 3 with question type "checkbox"
        Then "Appv2" I submit the assessment
        Then "Appv2" I can see the activity completion messages
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Have you personally engaged with your mentor within the last two weeks?(participant)" and description "You should engage with your mentor at least once every fortnight."
        Then "Appv2" I can see the fast feedback question 2 with title "Do you feel that your team is on track (participant)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Yes" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback
        Then "Appv2" I log out

    Scenario: Test team member review team work
        Given I go to App V2
        When "Appv2" I login with the student2 account and password "studentPassword"
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
