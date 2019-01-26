@Feature
Feature: AppV1 Team Chats Page
    As a student
    I want to login to the app and talk to my team mates
    so that we can share our ideas

    Scenario: Test Team Chats Page load successfully and send messages
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "#(user)" and password "#(password1)"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Chat" tab page
        Then "Appv1 Chats" I should see the channel "#(teamname)"
        Then "Appv1 Chats" I go to the channel "#(teamname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I can see the channel name "#(teamname)"
        Then "Appv1 Chats" I send messages within the channel "#(teamname)"
        Then "Appv1 Chats" I can see the messages within the channel "#(teamname)"
        Then "Appv1" I go back from chat page
        Then "Appv1" I log out