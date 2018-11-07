Feature: AppV1 current activty
	As a student
	I want to login to the app and see what is my current task
	so that I can know my current progress and start the work immediately

    Scenario: Test AppV1 current activty
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "studentPassword"
        Then I wait until the loading finished
        Then "Appv1" I should see the app home screen
        When I wait 6 seconds
        Then I should be able to see "current activty category" which is located at "//p[text()='Activity']" with xpath assert
        Then I should be able to see "current activity title" which is located at ".activity-name" containing text "Comprehensive Activity"
        Then "Appv1" I log out