private def getScenarioName(sobj)
    scenarioTitle = sobj.respond_to?(:scenario_outline) ? sobj.scenario_outline.title : ''
    scenarioName = sobj.respond_to?(:name) ? sobj.name : ''
    scenarioFullTitle = "%s %s" % [scenarioTitle, scenarioName]
    return scenarioFullTitle
end

AfterConfiguration do |config|
    puts("should only happen once")
    $configObj = loadConfig(Dir.pwd + "/configuration/user.json")
    $testLogger1 = Twplogger.instance
    $variableLoaded = false
    $currentFeatureFile = ""
    $visibleWait = $configObj["visibleWait"].to_i
    if $configObj["mode"] != "apiTest"
        $sharedWebDriver1 = SharedWebDriver.instance
        $sharedData1 = SharedData.instance
        $driver = $sharedWebDriver1.getDriver()
        $wait = $sharedWebDriver1.getWaitor()
        $shortWait = $sharedWebDriver1.getShortWaitor()
        $normalWait = $sharedWebDriver1.getNormalWaitor()
        $listWait = $sharedWebDriver1.getListWaitor()
        $appv1PageActions = Appv1PageActions.new
        $userService1 = UserService.instance
        if $configObj["mode"] == "hub" || $configObj["mode"] == "browserstack"
            $driver.file_detector = lambda do |args|
                str = args.first.to_s
                str if File.exist?(str)
            end
        end
        initTestData(Dir.pwd + "/data/team.json", Application.KEY_TEAM)
        initTestUserData(Dir.pwd + "/data/students.json", Application.KEY_STUDENTS)
        initTestUserData(Dir.pwd + "/data/mentors.json", Application.KEY_MENTORS)
        initTestDataWithKey(Dir.pwd + "/data/commons.json")
    end
end

Before do |scenario|
    @collectedErrors = []
    @stepCount = scenario.step_count
    @stepIndex = 0
    @scenarioFullTitle = getScenarioName(scenario)
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
    $variableLoaded = initTestData(dataFileName, baseName)
    if !$variableLoaded
        $variableLoaded = initTestData(commonDataFileName, baseName)
    end
    $currentFeatureFile = $variableLoaded? baseName : ""
end

After('@Feature') do
    $variableLoaded = false
    $currentFeatureFile = ""
end
