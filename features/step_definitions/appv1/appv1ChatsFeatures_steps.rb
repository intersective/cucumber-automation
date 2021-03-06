

Then(/^"Appv1 Chats" I should see the channel "([^"]*)"$/) do |channel|
    channelName = extract_parameter(channel, channel)
    step("I should see \"the message channel\" which is located at \"//*[@ng-if='chat.name || chat.team_name'][normalize-space()='#{channelName}']\" with xpath")
end

Then(/^"Appv1 Chats" I go to the channel "([^"]*)"$/) do |channel|
    channelName = extract_parameter(channel, channel)
    step("I click on \"the message channel\" which is located at \"//*[@ng-if='chat.name || chat.team_name'][normalize-space()='#{channelName}']/../..\" with xpath")
end

Then(/^"Appv1 Chats" I can see the channel name "([^"]*)"$/) do |channel|
    channelName = extract_parameter(channel, channel)
    step("I can see \"the message channel\" which is located at \"//*[@class='nav-bar-title'][normalize-space()='#{channelName}']\" with xpath")
end

Then(/^"Appv1 Chats" I send messages within the channel "([^"]*)"$/) do |channel|
    channelName = extract_parameter(channel, channel)
    message = "message " + generate_uni_id()
    step("I input \"#{message}\" to \"message input box\" which is located at \"//textarea[@ng-model='chatMessage']\" with xpath scroll")
    $sharedData1.put_data(Application.KEY_CHATMESSAGE + channelName, message)
    step("I click on \"send message button\" which is located at \"//button[@ng-click='sendMessage()']\" with xpath")
end

Then(/^"Appv1 Chats" I can see the messages within the channel "([^"]*)"$/) do |channel|
    channelName = extract_parameter(channel, channel)
    kchannelName = Application.KEY_CHATMESSAGE + channelName
    message = load_shared_data(kchannelName)
    step("I can see \"the messages\" which is located at \"//*[@class='message-text'][text()='#{message}']\" with xpath")
end
