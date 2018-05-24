Feature: AppV1 current milestone
	As a student
	I want to login to the app and see what is my current task
	so that I can know my current progress and start the work immediately

    Scenario: Test AppV1 current milestone
        Given I go to App V1
        Then I wait 10 seconds
        Then "Appv1" I login with the student account and password "12341234"
        Then I wait until the loading finished
        # Then "Appv1" I choose a program "App V1 Selenium Program"
        Then "Appv1" I should see the app home screen
        Then I wait 6 seconds
        Then "Appv1" I can see the current milestone "Comprehensive Milestone" with status "UNLOCKED"
        Then I wait 2 seconds
        Then "Appv1" I log out