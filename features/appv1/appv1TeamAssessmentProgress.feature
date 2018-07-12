Feature: AppV1 Team Assessment Progress
	As a student
	I want to login to the app and do something with team Assessment
	so that I can work with my team mates and my team mates would have the same assessment progress as mine

    Scenario: Test AppV1 Team Assessment Progress
        Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1 Team" I login with team member "student1" and password "12341234" and domain "practera.com"
        Then I wait until the loading finished
        Then "Appv1" I can see the overall project progress
        Then "Appv1" I log out
        Given I go to App V1
        Then I wait 10 seconds
        Then "Appv1 Team" I login with team member "student2" and password "12341234" and domain "practera.com"
        Then I wait until the loading finished
        Then "Appv1" I should have the same overall project progress
        Then "Appv1" I log out