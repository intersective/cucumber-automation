class Appv1PageActions

    def login(webDriver, waitor, accountName, password)
        loginForm = waitForElementVisible(webDriver, waitor, ".jsmbp-login-form")
        loginForm.find_element(:css => "input[name=uEmail]").clear
        loginForm.find_element(:css => "input[name=uEmail]").send_keys(accountName)
        loginForm.find_element(:css => "input[name=password]").clear
        loginForm.find_element(:css => "input[name=password]").send_keys(password)
        loginForm.find_element(:css => "#jsmbpLoginBtn").click()
    end

    def logout(webDriver, waitor)
        waitForElement(webDriver, waitor, ".tab-nav > a:nth-of-type(4)").click()
	    waitForElement(webDriver, waitor, ".jsmbp-settings-container ion-item[ng-click='logout()']").click()
        waitForElement(webDriver, waitor, ".jsmbp-login-form")
    end

end