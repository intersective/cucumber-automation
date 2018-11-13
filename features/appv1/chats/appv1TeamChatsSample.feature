@Feature
Feature: AppV1 Team Chats Page
    As a student
    I want to login to the app and talk to my team mates
    so that we can share our ideas

    Scenario: Test Team Chats Page load successfully and send messages
        Given I go to App V1
        Then "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with "user" and "password1"
        Then "Appv1" I should see the app home screen
        Then I wait until the loading finished
        Then "Appv1" I go to the "Chats" tab page
        Then I should be able to see "Team Message Channel" which is located at "//*[@ng-if='chat.name'][normalize-space()='Team']" with xpath assert
        Then I click on "Team Message Channel" which is located at "//*[@ng-if='chat.name'][normalize-space()='Team']" with xpath
        Then I wait until the loading finished
        Then I should be able to see "Team Message channel Title" which is located at "//*[@class='nav-bar-title'][normalize-space()='Team']" with xpath assert
        Then I input "selenium.20180724145400 messages one" to "message input box" which is located at "//input[@ng-model='chatMessage']" with xpath scroll
        Then I click on "send message button" which is located at "//button[@ng-click='sendMessage()']" with xpath
        Then I should be able to see "the messages" which is located at "//*[@class='message-text'][text()='selenium.20180724145400 messages one']" with xpath assert
        Then "Appv1" I go back from chat page
        Then "Appv1" I log out