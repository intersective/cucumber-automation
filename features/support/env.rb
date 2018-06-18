require_relative "../../module/helper"
require_relative "../../module/uitools"
require_relative "../../module/testLogger"
require_relative "../../module/sharedData"
require_relative "../../module/sharedWebDriver"
require_relative "../../module/actions/appv1"
require 'httparty'

at_exit do
    puts("tear down")
    if $testLogger1 != nil
        $testLogger1.close()
    end
    if $configObj["mode"] == "browserstack" || $configObj["mode"] == "hub"
        if $driver != nil
            puts("close driver")
            $driver.quit
        end
    end
end