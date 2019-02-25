class Appv1PageActions

    def login(webDriver, waitor, accountName, password)
        loginForm = wait_for_element_visible(webDriver, waitor, ".jsmbp-login-form")
        loginForm.find_element(:css => "input[name=uEmail]").clear
        loginForm.find_element(:css => "input[name=uEmail]").send_keys(accountName)
        loginForm.find_element(:css => "input[name=password]").clear
        loginForm.find_element(:css => "input[name=password]").send_keys(password)
        loginBtn = loginForm.find_element(:css => "#jsmbpLoginBtn")
        scroll_if_not_visible(webDriver, loginBtn)
        sleep 1
        loginBtn.click()
    end

    def logout(webDriver, waitor)
        wait_for_load_finished(webDriver, waitor)
        tabLocator = "//*[@class='tab-title'][normalize-space()='Help']/.."
        wait_for_element_visible_xpath($driver, $wait, tabLocator).click()
        sleep 5
        wait_for_load_finished(webDriver, waitor)
	    wait_for_element(webDriver, waitor, ".jsmbp-settings-container ion-item[ng-click='logout()']").click()
        wait_for_element(webDriver, waitor, ".jsmbp-login-form")
    end

    def get_question_answer_container(webDriver, waitor, questionIndex)
        one = wait_for_elements(webDriver, waitor, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
        aQuestionDescription = find_element_with_parent(one, "div[ng-if='question.description']")
        answerContainer = nil
        if aQuestionDescription != nil
            answerContainer = one.find_element(:css => "div:nth-of-type(3)")
        else
            answerContainer = one.find_element(:css => "div:nth-of-type(2)")
        end
        return answerContainer
    end
end