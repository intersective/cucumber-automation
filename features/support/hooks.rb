private def getScenarioName(sobj)
    scenarioTitle = sobj.respond_to?(:scenario_outline) ? sobj.scenario_outline.title : ''
    scenarioName = sobj.respond_to?(:name) ? sobj.name : ''
    scenarioFullTitle = "%s %s" % [scenarioTitle, scenarioName]
    return scenarioFullTitle
end

private def initTestData(filePath, key)
    testObj = readJsonfile(filePath)
    $sharedData1.putData(key, testObj)
end

private def initTestDataWithKey(filePath)
    if File.exist?(filePath)
        testObj = readJsonfile(filePath)
        testObj.each do |key, value|
            $sharedData1.putData(key, value)
        end
    end
end

AfterConfiguration do |config|
    puts("should only happen once")
    $configObj = readJsonfile(Dir.pwd + "/configuration/user.json")
    $testLogger1 = TestLogger.instance
    if $configObj["mode"] != "apiTest"
        $sharedWebDriver1 = SharedWebDriver.instance
        $sharedData1 = SharedData.instance
        $driver = $sharedWebDriver1.getDriver()
        $wait = $sharedWebDriver1.getWaitor()
        $shortWait = $sharedWebDriver1.getShortWaitor()
        $normalWait = $sharedWebDriver1.getNormalWaitor()
        $listWait = $sharedWebDriver1.getListWaitor()
        $appv1PageActions = Appv1PageActions.new
        if $configObj["mode"] == "hub" || $configObj["mode"] == "browserstack"
            $driver.file_detector = lambda do |args|
                str = args.first.to_s
                str if File.exist?(str)
            end
        end
        initTestData(Dir.pwd + "/data/team.json", "team")
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
        fail("#{@collectedErrors}")
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