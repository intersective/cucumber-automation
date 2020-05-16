private def get_scenario_name(sobj)
    scenarioTitle = sobj.respond_to?(:scenario_outline) ? sobj.scenario_outline.title : ''
    scenarioName = sobj.respond_to?(:name) ? sobj.name : ''
    scenarioFullTitle = "%s %s" % [scenarioTitle, scenarioName]
    return scenarioFullTitle
end

AfterConfiguration do |config|
    puts("should only happen once")
    $configObj = load_config(Dir.pwd + "/configuration/user.json")
    $testLogger1 = Twplogger.instance
    $variableLoaded = false
    $currentFeatureFile = ""
    $visibleWait = $configObj["VISIBLE_WAIT"].to_i
    $sharedData1 = SharedData.instance
    if $configObj["MODE"] != "apiTest"
        $sharedWebDriver1 = SharedWebDriver.instance
        $driver = $sharedWebDriver1.get_driver()
        $wait = $sharedWebDriver1.get_waitor()
        $shortWait = $sharedWebDriver1.get_short_waitor()
        $normalWait = $sharedWebDriver1.get_normal_waitor()
        $listWait = $sharedWebDriver1.get_list_waitor()
        $appv1PageActions = Appv1PageActions.new
        $userService1 = UserService.instance
        $eventService1 = EventService.instance
        if $configObj["MODE"] == "hub" || $configObj["MODE"] == "browserstack"
            $driver.file_detector = lambda do |args|
                str = args.first.to_s
                str if File.exist?(str)
            end
        end
        init_test_data(Dir.pwd + "/data/team.json", Application.KEY_TEAM)
        init_test_event_data(Dir.pwd + "/data/events.json", Application.KEY_CURRENTEVENT)
        init_test_user_data(Dir.pwd + "/data/students.json", Application.KEY_STUDENTS)
        init_test_user_data(Dir.pwd + "/data/mentors.json", Application.KEY_MENTORS)
        init_test_data_into_key(Dir.pwd + "/data/commons.json")
    end
    $sharedData1.put_data(Application.KEY_RUN_ID, SecureRandom.uuid)
end

Before do |scenario|
    @collectedErrors = []
    @stepCount = scenario.step_count
    @stepIndex = 0
    @scenarioFullTitle = get_scenario_name(scenario)
end

After do |scenario|
    if @collectedErrors.empty?
        if scenario.passed?
            message = "scenario [%s] succeed" % [@scenarioFullTitle]
            $testLogger1.debug(message)
        else
            if $driver != nil
                $driver.save_screenshot("%s/headlessScreenshot/%s.png" % [Dir.pwd, SecureRandom.uuid])
            end
            message = "scenario [%s] failed as reason - [%s]" % [@scenarioFullTitle, scenario.exception.message]
            $testLogger1.debug(message)
        end
    else
        fail(@collectedErrors.join("\n"))
    end
end

AfterStep do |reuslt, testStep|
    if @stepIndex < @stepCount
        message = "scenario [%s] step [%s]" % [@scenarioFullTitle, testStep.text]
        $testLogger1.debug(message)
        @stepIndex += 1
    end
end

Around('@RunTwoTimes') do |scenario, block|
    2.times { block.call }
end

Before('@Feature') do |testcase|
    featureFileName = testcase.location
    baseName = featureFileName.to_s.split("/")[1..-1].join("/").split(".")[0..-2].join(".") # eliminate the folder name features
    dataFileName = "%s/data/%s.json" % [Dir.pwd, baseName]
    commonDataFileName = "%s/data/%s/commons.json" % [Dir.pwd, baseName.split("/")[0]]
    $variableLoaded = init_test_data(dataFileName, baseName)
    if !$variableLoaded
        $variableLoaded = init_test_data(commonDataFileName, baseName)
    end
    $currentFeatureFile = $variableLoaded? baseName : ""
end

After('@Feature') do
    $variableLoaded = false
    $currentFeatureFile = ""
end
