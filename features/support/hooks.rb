private def getScenarioName(sobj)
    scenarioTitle = sobj.respond_to?(:scenario_outline) ? sobj.scenario_outline.title : ''
    scenarioName = sobj.respond_to?(:name) ? sobj.name : ''
    scenarioFullTitle = "%s %s" % [scenarioTitle, scenarioName]
    return scenarioFullTitle
end

AfterConfiguration do |config|
    puts("should only happen once")
    $testLogger1 = TestLogger.instance
    $sharedWebDriver1 = SharedWebDriver.instance
    $sharedData1 = SharedData.instance
    $driver = $sharedWebDriver1.getDriver()
    $wait = $sharedWebDriver1.getWaitor()
    $shortWait = $sharedWebDriver1.getShortWaitor()
    $normalWait = $sharedWebDriver1.getNormalWaitor()
    $configObj = readJsonfile(Dir.pwd + "/configuration/user.json")
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
        $testLogger1.logCase(message)
    else
        message = "scenario [%s] failed as reason - [%s]" % [@scenarioFullTitle, scenario.exception.message]
        $testLogger1.logCase(message)
    end
end

AfterStep do |reuslt, testStep|
    if @stepIndex < @stepCount
        message = "scenario [%s] step [%s]" % [@scenarioFullTitle, testStep.text]
        $testLogger1.logCase(message)
        @stepIndex += 1
    end
end

Around('@RunTwoTimes') do |scenario, block|
    2.times { block.call }
end