Feature: AppV1 Check Moderated Assessment Review After an admin edit
	As a student
	I want to login to the app and check the marking from a reviewer
	so that I can improve my work

    Scenario: Test Check Moderated Assessment Review
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I go to the assessment locating at "4"
        Then I can see "assessment page" which is located at ".pane[nav-view='active']"
        Then I can see "reviewer answer for question 1" which is located at "//*[normalize-space()='Q1. Text Question 1']/..//*[text()='Reviewer']/..//*[text()='Answer']/../*[text()='your works are excellent, thank you for submissions from admin_selenium']" with xpath scroll
        Then I can see "expert feedback choice" which is located at "//*[normalize-space()='Q1. Oneof Question 1']/..//*[text()='Reviewer']/..//*[text()='Answer']/../*[text()='Normal']" with xpath scroll
        Then I can see "expert feedback comment" which is located at "//*[normalize-space()='Q1. Oneof Question 1']/..//*[text()='Reviewer']/..//*[text()='Comment']/../*[text()='your works are excellent, thank you for submissions from admin_selenium']" with xpath scroll
        Then I can see "expert feedback choices" which is located at "//*[normalize-space()='Q1. Multiple Choice Question 1']/..//*[text()='Reviewer']/..//*[text()='Answer']/../*[text()='Choice 1, Choice 0.8, Choice 0.6, Choice 0.4']" with xpath scroll
        Then I can see "expert feedback comment" which is located at "//*[normalize-space()='Q1. Multiple Choice Question 1']/..//*[text()='Reviewer']/..//*[text()='Comment']/../*[text()='your work is good from admin_selenium']" with xpath scroll
        When "Appv1" I go back from assessment page
        Then "Appv1" I log out