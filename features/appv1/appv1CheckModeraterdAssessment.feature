Feature: AppV1 Check Moderated Assessment Answer
	As a student
	I want to login to the app and check the marking from a reviewer
	so that I can improve my work

    Scenario: Test Check Moderated Assessment Answer
        Given I go to "http://127.0.0.1:8888/"
        Then I wait 10 seconds
        Then "Appv1" I login with username "selenium.20180503165632@practera.com" and password "12341234"
        Then I wait until the loading finished
        Then "Appv1" I go to the first milestone page
        Then "Appv1" I go to the assessment locating at "4"
        Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] ion-view[state='p2.feedback'] .scroll"
        Then I should be able to see "text question answer for question 1" which is located at "//*[text()='Text Question 1']/../..//*[text()='This is the text from Selenium text automation']" with xpath scroll assert
        Then I should be able to see "reviewer answer for question 1" which is located at "//*[text()='Text Question 1']/../..//*[text()='Reviewer Answer']/../*[text()='your works are excellent, thank you for submissions']" with xpath scroll assert
        # Then I should not see "reviewer comments for question 1" which is located at "//*[text()='Text Question 1']/../..//*[text()='Reviewer Comments']" with xpath assert
        Then I should be able to see "oneof question answer" which is located at "//*[text()='Oneof Question 1']/../..//*[text()='Normal']" with xpath scroll assert
        Then I should be able to see "expert feedback choice" which is located at "//*[text()='Oneof Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='Good']" with xpath scroll assert
        Then I should be able to see "expert feedback text" which is located at "//*[text()='Oneof Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='your works are excellent, thank you for submissions']" with xpath scroll assert
        Then I should be able to see "my answer" which is located at "//*[text()='Multiple Choice Question 1']/../..//*[text()='Choice 0.8, Choice 0.6']" with xpath scroll assert
        Then I should be able to see "expert feedback choice" which is located at "//*[text()='Multiple Choice Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='Choice 1, Choice 0.4']" with xpath scroll assert
        Then I should be able to see "expert feedback text" which is located at "//*[text()='Multiple Choice Question 1']/../..//*[text()='Expert Feedback']/..//*[text()='your work is good']" with xpath scroll assert
        Then I can see "file question 1 -any" which is located at "div[ng-repeat='group in ::assessment.questionGroups']:nth-of-type(4) > div[ng-repeat='question in group.questions']:nth-of-type(2) div[ng-click='previewFile(answer._raw.answer)']" containing text "2017-Scrum-Guide-US.pdf"
        Then I can see "file question 1 -any" which is located at "div[ng-repeat='group in ::assessment.questionGroups']:nth-of-type(4) > div[ng-repeat='question in group.questions']:nth-of-type(3) div[ng-click='previewFile(answer._raw.answer)']" containing text "Video Upload issue 2.mp4"
        Then I can see "file question 1 -any" which is located at "div[ng-repeat='group in ::assessment.questionGroups']:nth-of-type(4) > div[ng-repeat='question in group.questions']:nth-of-type(4) div[ng-click='previewFile(answer._raw.answer)']" containing text "medium-size-dogs-a-medium.jpg"
        Then I click on "back button" which is located at ".nav-bar-block[nav-bar=active] .back-button"
        Then "Appv1" I log out