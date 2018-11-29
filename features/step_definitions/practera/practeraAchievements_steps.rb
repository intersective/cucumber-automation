

Then(/^"Practera Achieve" I will go to (Visible Badge|Hidden Badge|No Badge|Export) section$/) do |arg1|
    step("I click on \"section button\" which is located at \"//*[@id='achieve']//a[starts-with(normalize-space(),'#{arg1}')]\" with xpath")
end

Then(/^"Practera Achieve" I (should|can) see "([^"]*)"$/) do |arg1, achieveName|
    step("I #{arg1} see \"an achievement\" which is located at \"//*[@id='tblWorkflow']//*[normalize-space()='#{achieveName}']\" with xpath")
end

Then(/^"Practera Achieve" I will go to recipients of "([^"]*)"$/) do |achieveName|
    step("I click on \"recipients section button\" which is located at \"//*[@id='tblWorkflow']//*[normalize-space()='#{achieveName}']/../td[3]/a\" with xpath")
end

Then(/^"Practera Achieve" I (should|can) see (mentor|student)(|[1-9]+[0-9]*) has the ahievement$/) do |arg1, role, arg3|
    userName = getUserFromData(arg3, role).name
    step("\"Practera Achieve\" I #{arg1} see \"#{userName}\" has the ahievement")
end

Then(/^"Practera Achieve" I (should|can) see "([^"]*)" has the ahievement$/) do |arg1, userName|
    step("I #{arg1} see \"the user\" which is located at \"//*[@id='achievementusers']//*//*[@id='achievers']//*[normalize-space()='#{userName}']\" with xpath")
end
