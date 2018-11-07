Feature: AppV1 assessment status
	As a student
	I want to login to the app and check the assessment status
	so that I can know the progress of my assessments

    Scenario: Test AppV1 assessments status
        Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the student account and password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I can see the "Comprehensive Moderated" with status "Feedback available"
        Then "Appv1" I can see the "Comprehensive Quiz" with status "Assessment done"
        Then "Appv1" I can see the "Comprehensive Reflection" with status "Assessment done"
        Then I wait 3 seconds
        Then "Appv1" I log out