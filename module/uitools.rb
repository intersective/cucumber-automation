private def findElement(webDriver, selectorPath, selectorType="css")
	begin
		if selectorType == "css"
			return webDriver.find_element(:css => selectorPath)
		end
		if selectorType == "xpath"
			return webDriver.find_element(:xpath => selectorPath)
		end
		return webDriver.find_element(:css => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElement(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:css => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElementXpath(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:xpath => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElements(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_elements(:css => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElementVisible(webDriver, waitor, selectorPath)
	loop do
		ele = waitForElement(webDriver, waitor, selectorPath)
		if ele.displayed? || ele == nil
			break
		end
		sleep 1
	end
	return findElement(webDriver, selectorPath)
end

def waitForElementVisibleXpath(webDriver, waitor, selectorPath)
	loop do
		ele = waitForElementXpath(webDriver, waitor, selectorPath)
		if ele.displayed? || ele == nil
			break
		end
		sleep 1
	end
	return findElement(webDriver, selectorPath, "xpath")
end

def waitToastMessageDisappear(webDriver, waitor)
	sleep 1
	while waitForElement(webDriver, waitor, ".toast-message" ) != nil
		sleep 1
	end
end

def refineElementTextContent(ele)
	return ele.attribute("innerText").gsub("\n", "").strip
end

def waitForLoadFinished(webDriver, waitor)
	while waitForElement(webDriver, waitor, ".loading-container").attribute("class").index("active") != nil
		sleep 1
	end
	sleep 2
end

def waitForElementVisibleWithInAGroup(webDriver, waitor, selectorPath, index)
	i = index.to_i - 1
	elements = waitForElements(webDriver, waitor, selectorPath)
	while !elements[i].displayed?
		sleep 2
		elements = waitForElements($driver, $wait, selectorPath)
	end
	return elements[i]
end
