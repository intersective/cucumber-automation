

Then(/^"Practera" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
    step("I click on \"a button\" which is located at \"#main-nav > ul.nav > li:nth-of-type(2) > a\"")
    step("I should be able to see \"a form\" which is located at \"form#login\"")
    step("I input \"#{userName}\" to \"email input field\" which is located at \"form#login input#UserEmail\"")
    step("I input \"#{userPassword}\" to \"password input field\" which is located at \"form#login input#UserPassword\"")
    step("I click on \"a button\" which is located at \"form#login button\"")
    step("I should be able to see \"message\" which is located at \".toast-message\"")
    step("The \"message\" which is located at \".toast-message\" should be disappear")
    step("I wait 2 seconds")
end

Then(/^"Practera" I should see a student "([^"]*)" submission$/) do |studentName|
    found = false
    unassigneds = waitForElements($driver, $wait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr")
    unassigneds.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            found = true
            break
        end
    end
    if !found
        fail("I can not see the student submissions")
    end
end

Then(/^"Practera" I should see a student "([^"]*)" ready to publish submission$/) do |studentName|
    found = false
    readytopublishes = waitForElements($driver, $wait, "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            found = true
            break
        end
    end
    if !found
        fail("I can not see the student ready to publish submissions")
    end
end

Then(/^"Practera" I should see the student ready to publish submission$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I should see a student \"#{studentName}\" ready to publish submission")
end

Then(/^"Practera" I should see the student submission$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I should see a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to a student "([^"]*)" submission$/) do |mentorName, studentName|
    popover = nil
    index = 1
    unassigneds = waitForElements($driver, $wait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr")
    unassigneds.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            findElementWithParent(uas, "td:nth-of-type(3) > span a").click()
            popover = waitElementWithParent($wait, uas, "td:nth-of-type(3) > span > div.popover")
            break
        end
        index = index + 1
    end
    findElementWithParent(popover, ".popover-content input").send_keys(mentorName)
    waitForElement($driver, $wait, "ul.select2-results > li > div").click()
    findElementWithParent(popover, ".popover-content button.editable-submit").click()
    while waitForElement($driver, $shortWait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr:nth-of-type(" + index.to_s + ") td:nth-of-type(3) > span > div.popover") != nil
        sleep 1
    end
end

Then(/^"Practera" I can publish a student "([^"]*)" submission review$/) do |studentName|
    readytopublishes = waitForElements($driver, $wait, "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            $driver.execute_script("window.confirm = function(){return true;}")
            sleep 2
            findElementWithParent(uas, "td:nth-of-type(5) > span:nth-of-type(2) > a").click()
            break
        end
    end
end

Then(/^"Practera" I can publish the student submission review$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can publish a student \"#{studentName}\" submission review")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to the student submission$/) do |mentorName|
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can assign a mentor \"selenium_mentor2\" to a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
    toReviews = waitForElements($driver, $wait, "div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row")
    toReviews.each do |row|
        if studentName == refineElementTextContent(findElementWithParent(row, "div:nth-of-type(3)")) &&
            assessmentName == refineElementTextContent(findElementWithParent(row, "div:nth-of-type(1)"))
            findElementWithParent(row, "div:nth-of-type(4) > a").click()
            break
        end
    end
end

Then(/^"Practera" I can go to the review page with the student submission and the assessment "([^"]*)"$/) do |assessmentName|
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end