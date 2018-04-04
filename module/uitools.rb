def waitForElement(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:css => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
		return nil
	end
end

def waitForElementXpath(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:xpath => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
		return nil
	end
end

def waitForElements(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_elements(:css => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
		return nil
	end
end

def waitForElementVisible(webDriver, waitor, selectorPath)
	ele = waitForElement(webDriver, waitor, selectorPath)
	while !ele.displayed? do
		sleep 1
		ele = waitForElement(webDriver, waitor, selectorPath)
	end
	return webDriver.find_element(:css => selectorPath)
end

def waitForElementVisibleXpath(webDriver, waitor, selectorPath)
	ele = waitForElementXpath(webDriver, waitor, selectorPath)
	while !ele.displayed? do
		sleep 1
		ele = waitForElementXpath(webDriver, waitor, selectorPath)
	end
	return webDriver.find_element(:xpath => selectorPath)
end

def waitToastMessageDisappear(webDriver, waitor)
	sleep 1
	while waitForElement(webDriver, waitor, ".toast-message" ) != nil
		sleep 1
	end
end

def refineElementTextContent(txt)
	return txt.gsub("\n", "").strip
end

def waitForLoadFinished(webDriver, waitor)
	while waitForElement(webDriver, waitor, ".loading-container").attribute("class").index("active") != nil
		sleep 1
	end
	sleep 2
end