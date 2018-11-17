Feature: AppV1 team chats page
	As a student
	I want to login to the app and see who is working with me in the same team
	so that I can collaborate with them

    Scenario: Test AppV1 team chats page
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1 Team" I login with team member "student1" and password "studentPassword" and domain "practera.com"
        Then "Appv1" I should see the app home screen
        Then I wait until the loading finished
        Then "Appv1" I go to the "Chat" tab page
        Then I wait until the loading finished
        Then "Appv1 Team Chats" I can see team member "student2" name
        Then "Appv1" I log out