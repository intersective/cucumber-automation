Feature: AppV1 Check Moderated Assessment Answer
	As a student
	I want to login to the app and check the marking from a reviewer
	so that I can improve my work

    Scenario: Test Check Moderated Assessment Answer
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I go to the assessment locating at "4"
        Then I can see "assessment page" which is located at ".pane[nav-view='active']"

        Then I can see "Text Questions Group description" which is located at "//*[text()='Text Questions']/../*[text()='Comprehensive Moderated Text Questions Group description']" with xpath scroll
        Then I can see "text question 1 description" which is located at "//*[normalize-space()='Q1. Text Question 1']/..//*[text()='this is text question 1 description']" with xpath scroll
        Then I can see "text question answer" which is located at "//*[normalize-space()='Q1. Text Question 1']/..//*[text()='This is the text from Selenium text automation']" with xpath scroll
        Then "Appv1 Reviews" I can see reviewer answer "your works are excellent, thank you for submissions" of question "Q1. Text Question 1"

        Then I can see "Oneof Questions Group description" which is located at "//*[text()='Oneof Questions']/../*[text()='Comprehensive Moderated Oneof Questions Group description']" with xpath scroll
        Then I can see "this is text Oneof Question 1 description" which is located at "//*[normalize-space()='Q1. Oneof Question 1']/..//*[text()='this is text Oneof Question 1 description']" with xpath scroll
        Then I can see "oneof question answer" which is located at "//*[normalize-space()='Q1. Oneof Question 1']/..//*[text()='Normal']" with xpath scroll
        Then "Appv1 Reviews" I can see reviewer answer "Good" of question "Q1. Oneof Question 1"
        Then "Appv1 Reviews" I can see reviewer comment "your works are excellent, thank you for submissions" of question "Q1. Oneof Question 1"

        Then I can see "checkbox Questions Group description" which is located at "//*[text()='Multiple Choice Questions']/../*[text()='Comprehensive Moderated checkbox Questions Group description']" with xpath scroll
        Then I can see "checkbox Question 1 description" which is located at "//*[normalize-space()='Q1. Multiple Choice Question 1']/..//*[text()='Comprehensive Moderated checkbox Question 1 description']" with xpath scroll
        Then I can see "my answer" which is located at "//*[normalize-space()='Q1. Multiple Choice Question 1']/..//*[text()='Choice 0.8, Choice 0.6']" with xpath scroll
        Then "Appv1 Reviews" I can see reviewer answer "Choice 1, Choice 0.4" of question "Q1. Multiple Choice Question 1"
        Then "Appv1 Reviews" I can see reviewer comment "your work is good" of question "Q1. Multiple Choice Question 1"

        Then I can see "File Questions Group description" which is located at "//*[text()='File Questions']/../*[text()='Comprehensive Moderated File Questions Group description']" with xpath scroll
        Then I can see "File Question 1 -any description" which is located at "//*[normalize-space()='Q1. File Question 1 - any']/..//*[text()='Comprehensive Moderated File Question 1 -any description']" with xpath scroll
        Then I can see "pdf file" which is located at "//*[normalize-space()='Q1. File Question 1 - any']/..//*[@class='file-name']" with xpath containing text "2017-Scrum-Guide-US.pdf"
        Then I can see "File Question 2 - video description" which is located at "//*[normalize-space()='Q2. File Question 2 - video']/..//*[text()='Comprehensive Moderated File Question 2 - video description']" with xpath scroll
        Then I can see "video file" which is located at "//*[normalize-space()='Q2. File Question 2 - video']/..//*[@class='file-name']" with xpath containing text "Video Upload issue 2.mp4"
        Then I can see "File Question 3 - image description" which is located at "//*[normalize-space()='Q3. File Question 3 - image']/..//*[text()='Comprehensive Moderated File Question 3 - image description']" with xpath scroll
        Then I can see "file question 3 - image" which is located at "//*[normalize-space()='Q3. File Question 3 - image']/..//*[@class='file-name']" with xpath containing text "medium-size-dogs-a-medium.jpg"
        
        Then I can see "Video Questions Group description" which is located at "//*[text()='Video Questions']/../*[text()='Comprehensive Moderated Video Questions Group description']" with xpath scroll
        Then I can see "Video Question 1 description" which is located at "//*[normalize-space()='Q1. Video Question 1']/..//*[text()='Comprehensive Moderated Video Question 1 description']" with xpath scroll
        Then I can see "Video Question 1" which is located at "//*[normalize-space()='Q1. Video Question 1']/..//*[@class='file-name']" with xpath containing text "WhatsApp Video 2017-11-30 at 11.27.14.mp4"
        
        When "Appv1" I go back from assessment page
        Then "Appv1" I log out