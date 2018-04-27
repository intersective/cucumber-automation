Feature: AppV1 moderated assessment status
	As a student
	I want to login to the app and check the moderated assessment status
	so that I can know the reviewing progress of my assessments

    Scenario: Test AppV1 moderated assessment status
        Given I go to "https://appdev.practera.com"
		Then I wait 10 seconds
		Then "Appv1" I login with the student account and password "12341234"
        Then I wait until the loading finished
        Then "Appv1" I go to the first milestone page
        Then "Appv1" I can see the "Comprehensive Moderated" with status "PENDING APPROVAL"
        Then I wait 3 seconds
        Then "Appv1" I log out