private def getScenarioName(sobj)
    scenarioTitle = sobj.respond_to?(:scenario_outline) ? sobj.scenario_outline.title : ''
    scenarioName = sobj.respond_to?(:name) ? sobj.name : ''
    scenarioFullTitle = "%s %s" % [scenarioTitle, scenarioName]
    return scenarioFullTitle
end

AfterConfiguration do |config|
    puts("should only happen once")
    $configObj = readJsonfile(Dir.pwd + "/configuration/user.json")
    $testLogger1 = TestLogger.instance
    if !$configObj["apiTest"]
        $sharedWebDriver1 = SharedWebDriver.instance
        $sharedData1 = SharedData.instance
        $driver = $sharedWebDriver1.getDriver()
        $wait = $sharedWebDriver1.getWaitor()
        $shortWait = $sharedWebDriver1.getShortWaitor()
        $normalWait = $sharedWebDriver1.getNormalWaitor()
        $listWait = $sharedWebDriver1.getListWaitor()
    end
    $appv1PageActions = Appv1PageActions.new
end

Before do |scenario|
    @stepCount = scenario.step_count
    @stepIndex = 0
    @scenarioFullTitle = getScenarioName(scenario)
end

After do |scenario|
    if scenario.passed?
        message = "scenario [%s] succeed" % [@scenarioFullTitle]
        $testLogger1.debug(message)
    else
        $driver.save_screenshot("%s/headlessReport/%s.png" % [Dir.pwd, SecureRandom.uuid])
        message = "scenario [%s] failed as reason - [%s]" % [@scenarioFullTitle, scenario.exception.message]
        $testLogger1.debug(message)
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