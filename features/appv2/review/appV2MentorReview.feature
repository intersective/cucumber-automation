Feature: AppV2 mentor review moderated assessment
    As a reviewer
	I want to login to the app and review the moderated assessment
	so that I can experience the program contents

    Scenario: Test AppV2 mentor review moderated assessment
        Given I go to App V2
		Then "Appv2" I login with username "#(appv2MentorAccount)" and password "#(mentorAccountPassword)"
		Then "Appv2" I choose a program "App V2 Automation Program"
		When "Appv2" I wait for loading finished
        Then "Appv2" I go to the "Review" tab page
		Then I can see "the review list page" which is located at "app-reviews ion-content"
		Then "Appv2 Reviews" I go to To do section
		When "Appv2" I wait for loading finished
        Then "Appv2 Reviews" I can go to the review page with the student1 submission and the assessment "Comprehensive Moderated"
        When "Appv2" I wait for loading finished
        Then I can see "the review page" which is located at "app-assessment ion-content"
		Then "Appv2 Reviews" I input review answer "mentor good" to question 1
		Then "Appv2 Reviews" I input review comment "mentor good comment" to question 1
		Then "Appv2" I answer "Good" for question 2 with question type "multiple choice"
		Then "Appv2 Reviews" I input review comment "mentor good comment" to question 2
		Then "Appv2" I answer "Choice 1,Choice 0.6" for question 3 with question type "checkbox"
		Then "Appv2 Reviews" I input review comment "mentor good comment" to question 3
		Then "Appv2" I submit the review
		Then "Appv2" I can see the submisison success messages
        Then "Appv2" I can see the fast feedback questions
        Then "Appv2" I can see the fast feedback question 1 with title "Do you feel that your team is on track(mentor)?" and description "Do you feel that your team is on track?"
        Then "Appv2" I can see the fast feedback question 2 with title "In which stage do you think your team is at?(mentor)" and description "In which stage do you think your team is at? Refer to the project content if you are unsure which about the different stages."
        Then "Appv2" I answer "Yes" for the fast feedback question "1"
        Then "Appv2" I answer "Norming" for the fast feedback question "2"
        Then "Appv2" I submit the fast feedback
        Then "Appv2" I log out