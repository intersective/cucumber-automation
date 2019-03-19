Feature: AppV2 quiz assessment
	As a student
	I want to login to the app and do something with quiz assessment
	so that I can experience the program contents

    Scenario: Test AppV2 quiz assessment
        Given I go to App V2
        When "Appv2" I login with the student account and password "studentPassword"
        Then "Appv2" I choose a program "App V2 Automation Program"
        Then "Appv2" I wait for loading finished
        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Comprehensive Activity" activity
        Then "Appv2" I go to the assessment "Comprehensive Quiz"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the assessment with name "Comprehensive Quiz" and description "This is a comprehensive quiz"
        Then "Appv2" I can see question group 1 name "Text Questions" and description "Comprehensive Quiz Text Questions Group description"
        Then "Appv2" I can see question 1 name "Text Question 1" and description "Comprehensive Quiz Text Question 1 description"
        Then "Appv2" I answer "ohhh gogoggoo" for question 1 with question type "text"
        Then "Appv2" I can see question group 2 name "Oneof Questions" and description "Comprehensive Quiz Oneof Questions Group description"
        Then "Appv2" I can see question 2 name "Oneof Question 1" and description "Comprehensive Quiz Oneof Question description"
        Then "Appv2" I answer "Bad" for question 2 with question type "multiple choice"
        Then "Appv2" I can see question group 3 name "Multiple Choice Questions" and description "Comprehensive Quiz checkbox Question Groups description"
        Then "Appv2" I can see question 3 name "Multiple Choice Question 1" and description "Comprehensive Quiz checkbox Question 1 description"
        Then "Appv2" I answer "Choice 0.6,Choice 0.4" for question 3 with question type "checkbox"
        Then "Appv2" I can see question group 4 name "File Questions" and description "Comprehensive Quiz File Questions Group description"
        Then "Appv2" I can see question 4 name "File Question 1 - any" and description "Comprehensive Quiz File Question 1 -any description"
        Then "Appv2" I can see question 5 name "File Question 2 - video" and description "Comprehensive Quiz File Question 2 - video description"
        Then "Appv2" I can see question 6 name "File Question 3 - image" and description "Comprehensive Quiz File Question 3 - image description"
        Then "Appv2" I answer "2017-Scrum-Guide-US.pdf" for question 4 with question type "file"
        Then "Appv2" I answer "Video Upload issue 2.mp4" for question 5 with question type "file"
        Then "Appv2" I answer "medium-size-dogs-a-medium.jpg" for question 6 with question type "file"
        Then "Appv2" I submit the assessment
        Then "Appv2" I can see the submisison success messages
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Have you personally engaged with your mentor within the last two weeks?(participant)" and description "You should engage with your mentor at least once every fortnight."
        Then "Appv2" I can see the fast feedback question 2 with title "Do you feel that your team is on track (participant)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Yes" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback
        Then "Appv2" I can see progress 11
        Then "Appv2" I log out
