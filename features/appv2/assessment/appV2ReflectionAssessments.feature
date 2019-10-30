Feature: AppV2 reflection assessment
	As a student
	I want to login to the app and submit the reflection to the program admin
	so that I can share the findings

    Scenario: Test AppV2 reflection assessment
        Given I go to App V2
        When "Appv2" I login with the student account and password "studentPassword"
        Then "Appv2" I choose a program "App Automation Program"
        Then "Appv2" I wait for loading finished
        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Comprehensive Activity" activity
        Then "Appv2" I go to the assessment "Comprehensive Reflection"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the assessment with name "Comprehensive Reflection" and description "This is a comprehensive reflection"
        Then "Appv2" I can see question group 1 name "Text Questions" and description ""
        Then "Appv2" I can see question 1 name "Text Question 1" and description ""
        Then "Appv2" I answer "good good" for question 1 with question type "text"
        Then "Appv2" I can see question group 2 name "Oneof Questions" and description ""
        Then "Appv2" I can see question 2 name "Oneof Question 1" and description ""
        Then "Appv2" I answer "Good" for question 2 with question type "multiple choice"
        Then "Appv2" I can see question group 3 name "Multiple Choice Questions" and description ""
        Then "Appv2" I can see question 3 name "Multiple Choice Question 1" and description ""
        Then "Appv2" I answer "Choice 1,Choice 0.8" for question 3 with question type "checkbox"
        Then "Appv2" I can see question group 4 name "File Questions" and description ""
        Then "Appv2" I can see question 4 name "File Question 1 - any" and description ""
        Then "Appv2" I can see question 5 name "File Question 2 - video" and description ""
        Then "Appv2" I can see question 6 name "File Question 3 - image" and description ""
        Then "Appv2" I answer "2017-Scrum-Guide-US.pdf" for question 4 with question type "file"
        Then "Appv2" I answer "Video Upload issue 2.mp4" for question 5 with question type "file"
        Then "Appv2" I answer "medium-size-dogs-a-medium.jpg" for question 6 with question type "file"
        Then "Appv2" I submit the assessment
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Have you personally engaged with your mentor within the last two weeks?(participant)" and description "You should engage with your mentor at least once every fortnight."
        Then "Appv2" I can see the fast feedback question 2 with title "Do you feel that your team is on track (participant)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Yes" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback
        Then I wait 5 seconds
        Then "Appv2" I go back from assessment page
        Then I wait 3 seconds
        Then "Appv2" I go to the "Home" tab page
        Then "Appv2" I can see progress 14
        Then "Appv2" I log out