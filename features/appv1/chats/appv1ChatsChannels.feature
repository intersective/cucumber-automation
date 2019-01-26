@Feature
Feature: AppV1 chatting on multiple channel
    As a student or review
    I want to collaborate with my teammates with direct messaging
    so that we can share our ideas

    Scenario: Test AppV1 chatting on multiple channel
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
        Then "Appv1 Chats" I go to the channel "#(mentorchannelname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I send messages within the channel "#(mentorchannelname)"
        Then "Appv1 Chats" I can see the messages within the channel "#(mentorchannelname)"
        Then "Appv1" I go back from chat page
        Then "Appv1 Chats" I go to the channel "#(user3channelname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I send messages within the channel "#(user3channelname)"
        Then "Appv1 Chats" I can see the messages within the channel "#(user3channelname)"
        Then "Appv1" I go back from chat page
        Then "Appv1" I log out

        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "#(mentor)" and password "#(mentor2AccountPassword)"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Chat" tab page
        Then "Appv1 Chats" I go to the channel "#(teamname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I can see the messages within the channel "#(teamname)"
        Then "Appv1 Chats" I send messages within the channel "#(teamname)"
        Then "Appv1 Chats" I can see the messages within the channel "#(teamname)"
        Then "Appv1" I go back from chat page
        Then "Appv1 Chats" I go to the channel "#(userchannelname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I can see the messages within the channel "#(mentorchannelname)"
        Then "Appv1" I go back from chat page
        Then "Appv1" I log out

        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "#(user3)" and password "#(password1)"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then "Appv1" I go to the "Chat" tab page
        Then "Appv1 Chats" I go to the channel "#(teamname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I can see the messages within the channel "#(teamname)"
        Then "Appv1" I go back from chat page
        Then "Appv1 Chats" I go to the channel "#(userchannelname)"
        When I wait until the loading finished
        Then "Appv1 Chats" I can see the messages within the channel "#(user3channelname)"
        Then "Appv1" I go back from chat page
        Then "Appv1" I log out