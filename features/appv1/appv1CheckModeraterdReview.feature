Feature: AppV1 Check Moderated Assessment Review After an admin edit
	As a student
	I want to login to the app and check the marking from a reviewer
	so that I can improve my work

    Scenario: Test Check Moderated Assessment Review
        Given I go to App V1
        Then I wait 10 seconds
        Then "Appv1" I login with the student account and password "12341234"
        Then I wait until the loading finished
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I go to the assessment locating at "4"
        Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
        Then I should be able to see "reviewer answer for question 1" which is located at "//*[text()='Text Question 1']/../..//*[text()='Reviewer Answer']/../*[text()='your works are excellent, thank you for submissions from admin_selenium']" with xpath scroll assert
        Then I should be able to see "expert feedback choice" which is located at "//*[text()='Oneof Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='Normal']" with xpath scroll assert
        Then I should be able to see "expert feedback text" which is located at "//*[text()='Oneof Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='your works are excellent, thank you for submissions from admin_selenium']" with xpath scroll assert
        Then I should be able to see "expert feedback choice" which is located at "//*[text()='Multiple Choice Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='Choice 0.8, Choice 0.6']" with xpath scroll assert
        Then I should be able to see "expert feedback text" which is located at "//*[text()='Multiple Choice Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='your work is good from admin_selenium']" with xpath scroll assert
        Then I click on "back button" which is located at ".nav-bar-block[nav-bar=active] .back-button"
        Then "Appv1" I log out