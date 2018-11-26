Feature: AppV1 peer review moderated assessment
    As a reviewer
	I want to login to the app and review the moderated assessment
	so that I can experience the program contents

    Scenario: Test AppV1 peer review moderated assessment
        Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the student2 account and password "studentPassword"
		Then "Appv1" I should see the app home screen
		When I wait until the loading finished
		Then "Appv1" I go to the "Reviews" tab page
		When I wait until the loading finished
        Then "Appv1 Reviews" I can go to the review page with the student1 submission and the assessment "Moderated 4 - participant no file and video url"
        When I wait until the loading finished
        Then I can see "the review page" which is located at "*[name='reviews'][nav-view='active']"
		Then "Appv1 Reviews" I input review answer "This is the text from Selenium text automation" of question "Q1. Text Question 1"
		Then "Appv1 Reviews" I input review comment "This is the text from Selenium text automation" of question "Q1. Text Question 1"
		Then "Appv1 Reviews" I choose review answer "Good" of question "Q1. Oneof Question 1"
		Then "Appv1 Reviews" I input review comment "This is the text from Selenium text automation" of question "Q1. Oneof Question 1"
		Then "Appv1 Reviews" I choose review answer "Choice 1" of question "Q1. Multiple Choice Question 1"
		Then "Appv1 Reviews" I choose review answer "Choice 0.4" of question "Q1. Multiple Choice Question 1"
		Then "Appv1 Reviews" I input review comment "This is the text from Selenium text automation" of question "Q1. Multiple Choice Question 1"
        Then I wait 2 seconds
		When I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I can see "a submit confirmation" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I can see "a submission notification" which is located at ".popup"
		Then I wait 3 seconds
		Then I click on "the continue button" which is located at ".popup > .popup-buttons > button"
		Then I wait 3 seconds
		Then "Appv1 Reviews" I go to Done section
		Then "Appv1 Reviews" I can go to the review page with the student1 submission and the assessment "Moderated 4 - participant no file and video url"
		Then "Appv1 Reviews" I can see reviewer answer "This is the text from Selenium text automation" of question "Q1. Text Question 1"
		Then "Appv1 Reviews" I can see reviewer comment "This is the text from Selenium text automation" of question "Q1. Text Question 1"
		Then "Appv1 Reviews" I can see reviewer answer "Good" of question "Q1. Oneof Question 1"
		Then "Appv1 Reviews" I can see reviewer comment "This is the text from Selenium text automation" of question "Q1. Oneof Question 1"
		Then "Appv1 Reviews" I can see reviewer answer "Choice 1, Choice 0.4" of question "Q1. Multiple Choice Question 1"
		Then "Appv1 Reviews" I can see reviewer comment "This is the text from Selenium text automation" of question "Q1. Multiple Choice Question 1"
		Then "Appv1" I go back from assessment page
		Then "Appv1" I log out