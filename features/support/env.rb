require_relative "../../module/helper"
require_relative "../../module/uitools"
require_relative "../../module/testLogger"
require_relative "../../module/twplogger"
require_relative "../../module/sharedData"
require_relative "../../module/sharedWebDriver"
require_relative "../../module/actions/appv1"
require_relative "../../module/networktools"
require_relative "../../module/model/student"
require_relative "../../module/model/event"
require_relative "../../module/constants/application"
require_relative "../../module/service/userService"
require_relative "../../module/service/eventService"
require_relative "../../module/service/APIService"
require_relative "../../module/initDataHelper"
require 'httparty'
require 'nokogiri'


at_exit do
    puts("tear down")
    if $testLogger1 != nil
        $testLogger1.close()
    end
    if $configObj["MODE"] == "browserstack" || $configObj["MODE"] == "hub"
        if $driver != nil
            puts("close driver")
            $driver.quit
        end
    end
end