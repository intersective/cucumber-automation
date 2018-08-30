class Appv1PageActions

    def login(webDriver, waitor, accountName, password)
        loginForm = waitForElementVisible(webDriver, waitor, ".jsmbp-login-form")
        loginForm.find_element(:css => "input[name=uEmail]").clear
        loginForm.find_element(:css => "input[name=uEmail]").send_keys(accountName)
        loginForm.find_element(:css => "input[name=password]").clear
        loginForm.find_element(:css => "input[name=password]").send_keys(password)
        loginBtn = loginForm.find_element(:css => "#jsmbpLoginBtn")
        scrollIfNotVisible(webDriver, loginBtn)
        sleep 1
        loginBtn.click()
    end

    def logout(webDriver, waitor)
        waitForLoadFinished(webDriver, waitor)
        tabLocator = "//*[@class='tab-title'][normalize-space()='Help']/.."
        waitForElementVisibleXpath($driver, $wait, tabLocator).click()
        sleep 5
        waitForLoadFinished(webDriver, waitor)
	    waitForElement(webDriver, waitor, ".jsmbp-settings-container ion-item[ng-click='logout()']").click()
        waitForElement(webDriver, waitor, ".jsmbp-login-form")
    end

    def getQuestionAnswerContainer(webDriver, waitor, questionIndex)
        one = waitForElements(webDriver, waitor, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
        aQuestionDescription = findElementWithParent(one, "div[ng-if='question.description']")
        answerContainer = nil
        if aQuestionDescription != nil
            answerContainer = one.find_element(:css => "div:nth-of-type(3)")
        else
            answerContainer = one.find_element(:css => "div:nth-of-type(2)")
        end
        return answerContainer
    end
end