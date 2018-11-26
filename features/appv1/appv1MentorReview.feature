Feature: AppV1 mentor review moderated assessment
    As a reviewer
	I want to login to the app and review the moderated assessment
	so that I can experience the program contents

    Scenario: Test AppV1 mentor review moderated assessment
        Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the mentor account and password "mentor2AccountPassword"
		Then "Appv1" I should see the app home screen
		When I wait until the loading finished
        Then I click on "reviews tab button" which is located at "//*[text()='Reviews']/.." with xpath
		When I wait until the loading finished
        Then "Appv1 Reviews" I can go to the review page with the student1 submission and the assessment "Moderated 4 - participant no file and video url"
        When I wait until the loading finished
        Then I can see "the review page" which is located at "*[name='reviews'][nav-view='active']"
        Then I input "This is the text from Selenium text automation" to "text review answer" which is located at "//*[@class='question-group'][1]/question[1]//textarea[1]" with xpath scroll
        Then I input "This is the text from Selenium text automation" to "text review comment" which is located at "//*[@class='question-group'][1]/question[1]//textarea[2]" with xpath scroll
        Then I click on "Good option" which is located at "//*[@class='question-group'][2]/question[1]//label//span[normalize-space()='Good']/../../.." with xpath scroll
        Then I input "This is the text from Selenium text automation" to "oneof review comment" which is located at "//*[@class='question-group'][2]/question[1]//textarea[1]" with xpath scroll
        Then I click on "Choice 1 option" which is located at "//*[@class='question-group'][3]/question[1]//label//span[normalize-space()='Choice 1']/../.." with xpath scroll
        Then I click on "Choice 0.4 option" which is located at "//*[@class='question-group'][3]/question[1]//label//span[normalize-space()='Choice 0.4']/../.." with xpath scroll
        Then I input "This is the text from Selenium text automation" to "checkbox review comment" which is located at "//*[@class='question-group'][3]/question[1]//textarea[1]" with xpath scroll
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