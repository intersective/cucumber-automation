Feature: AppV1 Team Assessment Progress
	As a student
	I want to login to the app and do something with team Assessment
	so that I can work with my team mates and my team mates would have the same assessment progress as mine

    Scenario: Test AppV1 Team Assessment Progress
        Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student1" and password "studentPassword" and domain "practera.com"
        Then "Appv1" I should see the app home screen
        Then I wait until the loading finished
        Then "Appv1" I can see the overall project progress
        Then "Appv1" I log out
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1 Team" I login with team member "student2" and password "studentPassword" and domain "practera.com"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I should have the same overall project progress
        Then "Appv1" I log out