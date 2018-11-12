Feature: AppV1 assessment and questions display logic
    As a student or mentor
    I want to login to the app and check my assessments
    so that I can organise my works

    Scenario: Test the assessment visibility for a participant
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "selenium.20181110105448a3adf0db1691@practera.com" and a predefined password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Activity Four" activity page which has "1" items
        Then "Appv1" I can see the "assessment" locating at "1" with title "Comprehensive Moderated 2" and category "assessment"
        Then "Appv1" I go to the assessment locating at "1"
        Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
        Then "Appv1" I can see the assessment with name "Comprehensive Moderated 2" and description "This is a comprehensive moderated 2"
        Then I can see "question group description" which is located at "//*[text()='Text Questions']/../*[text()='Comprehensive Moderated 2 Text Questions Group description']" with xpath
        Then I can see "question group description" which is located at "//*[text()='Oneof Questions']/../*[text()='Comprehensive Moderated 2 Oneof Questions Group description']" with xpath
        Then I can see "question group description" which is located at "//*[text()='Multiple Choice Questions']/../*[text()='Comprehensive Moderated 2 checkbox Question Groups description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Text Questions']/../..//*[text()='Comprehensive Moderated 2 Text Question 1 description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Oneof Questions']/../..//*[text()='Comprehensive Moderated 2 Oneof Question description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Multiple Choice Questions']/../..//*[text()='Comprehensive Moderated 2 checkbox Question 1 description']" with xpath
        When "Appv1" I go back from assessment page
        Then "Appv1" I log out
    
    Scenario: Test the assessment visibility for a mentor
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with "mentor2Account" and "mentor2AccountPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Activity Four" activity page which has "1" items
        Then "Appv1" I can see the "assessment" locating at "1" with title "Comprehensive Moderated 3" and category "assessment"
        Then "Appv1" I go to the assessment locating at "1"
        Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
        Then "Appv1" I can see the assessment with name "Comprehensive Moderated 3" and description "This is a comprehensive moderated 3"
        Then I can see "question group description" which is located at "//*[text()='Text Questions']/../*[text()='Comprehensive Moderated 3 Text Questions Group description']" with xpath
        Then I can see "question group description" which is located at "//*[text()='Oneof Questions']/../*[text()='Comprehensive Moderated 3 Oneof Questions Group description']" with xpath
        Then I can see "question group description" which is located at "//*[text()='Multiple Choice Questions']/../*[text()='Comprehensive Moderated 3 checkbox Question Groups description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Text Questions']/../..//*[text()='Comprehensive Moderated 3 Text Question 1 description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Oneof Questions']/../..//*[text()='Comprehensive Moderated 3 Oneof Question description']" with xpath
        Then I can see "question description" which is located at "//*[text()='Multiple Choice Questions']/../..//*[text()='Comprehensive Moderated 3 checkbox Question 1 description']" with xpath
        When "Appv1" I go back from assessment page
        Then "Appv1" I log out
