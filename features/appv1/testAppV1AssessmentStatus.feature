Feature: AppV1 assessment status
	As a student
	I want to login to the app and check the assessment status
	so that I can know the progress of my assessments

    Scenario: Test AppV1 assessments status
        Given I go to "https://appdev.practera.com"
		Then I wait 10 seconds
		Then "Appv1" I login with the student account and password "12341234"
        Then I wait until the loading finished
        Then "Appv1" I go to the first milestone page
        Then "Appv1" I can see the "Comprehensive Moderated" with status "PUBLISHED"
        Then "Appv1" I can see the "Comprehensive Quiz" with status "DONE"
        Then "Appv1" I can see the "Comprehensive Reflection" with status "DONE"
        Then I wait 3 seconds
        Then "Appv1" I log out