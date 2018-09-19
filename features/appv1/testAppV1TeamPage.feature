Feature: AppV1 team page
	As a student
	I want to login to the app and see who is working with me in the same team
	so that I can collaborate with them

    Scenario: Test AppV1 team page
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1 Team" I login with team member "student1" and password "12341234" and domain "practera.com"
        Then "Appv1" I should see the app home screen
        Then I wait until the loading finished
        Then "Appv1" I go to the "Team" tab page
        Then I wait until the loading finished
        Then "Appv1 Team" I should be able to see the team name with assert
        Then "Appv1 Team" I can see "1" team member "student2" name
        Then "Appv1 Team" I can see "1" team member "student2" email with domain "practera.com"
        Then "Appv1" I log out