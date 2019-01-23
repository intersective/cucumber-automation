VIEWPORTSCRIPTS = "var elem = arguments[0],                 " +
      "  box = elem.getBoundingClientRect(),    " +
      "  cx = box.left + box.width / 2,         " +
      "  cy = box.top + box.height / 2,         " +
      "  e = document.elementFromPoint(cx, cy); " +
      "for (; e; e = e.parentElement) {         " +
      "  if (e === elem)                        " +
      "    return true;                         " +
      "}                                        " +
      "return false;"

private def findElement(webDriver, selectorPath, selectorType=Application.KEY_CSS)
	begin
		if selectorType == Application.KEY_XPATH
			return webDriver.find_element(:xpath => selectorPath)
		end
		return webDriver.find_element(:css => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def findElementWithParent(parentEle, selectorPath, selectorType=Application.KEY_CSS)
	begin
		if selectorType == Application.KEY_XPATH
			return parentEle.find_element(:xpath => selectorPath)
		end
		return parentEle.find_element(:css => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitElementWithParent(waitor, parentEle, selectorPath, selectorType=Application.KEY_CSS)
	begin
		if selectorType == Application.KEY_XPATH
			return waitor.until { parentEle.find_element(:xpath => selectorPath) }
		end
		return waitor.until { parentEle.find_element(:css => selectorPath) }
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

def waitForElementsXpath(webDriver, waitor, selectorPath)
	begin
		waitor.until { webDriver.find_elements(:xpath => selectorPath).length > 0 }
		return webDriver.find_elements(:xpath => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElements(webDriver, waitor, selectorPath)
	begin
		waitor.until { webDriver.find_elements(:css => selectorPath).length > 0 }
		return webDriver.find_elements(:css => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def waitForElementVisible(webDriver, waitor, selectorPath)
	counter = 0
	while counter < $visibleWait
		ele = waitForElement(webDriver, waitor, selectorPath)
		if ele == nil || ele.displayed?
			break
		end
		counter = counter + 1
		sleep 1
	end
	return findElement(webDriver, selectorPath)
end

def waitForElementVisibleXpath(webDriver, waitor, selectorPath)
	counter = 0
	while counter < $visibleWait
		ele = waitForElementXpath(webDriver, waitor, selectorPath)
		if ele == nil || ele.displayed?
			break
		end
		counter = counter + 1
		sleep 1
	end
	return findElement(webDriver, selectorPath, Application.KEY_XPATH)
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

def refineElementHtmlTextContent(ele)
	return ele.attribute("textContent").gsub("\n", "").strip
end

def waitForLoadFinished(webDriver, waitor)
	while waitForElement(webDriver, waitor, ".loading-container").attribute("class").index("active") != nil
		sleep 1
	end
	clickBlock = waitForElement(webDriver, waitor, ".click-block")
	if clickBlock != nil
		while clickBlock.attribute("class").index("click-block-active") != nil
			sleep 1
			clickBlock = waitForElement(webDriver, waitor, ".click-block")
		end
	end
	sleep 2
end

def waitForElementVisibleWithInAGroup(webDriver, waitor, selectorPath, index)
	counter = 0
	i = index.to_i - 1
	elements = waitForElements(webDriver, waitor, selectorPath)
	while counter < $visibleWait && !elements[i].displayed?
		counter = counter + 1
		sleep 1
		elements = waitForElements(webDriver, waitor, selectorPath)
	end
	return elements[i]
end

def scrollIfNotVisible(webDriver, ele)
	while !ele.displayed?
		webDriver.action.move_to(ele).perform
		sleep 1
	end
end

def scrollIfNotVisibleByKeyBoard(webDriver, parentEle, ele)
	inViewport = isElementInViewpport(webDriver, ele)
	if !inViewport
		$driver.action.move_to(parentEle, 15, 15).perform
		$driver.action.click().perform
		while !inViewport
			webDriver.action.send_keys(:arrow_down).perform
			sleep 1
			inViewport = isElementInViewpport(webDriver, ele)
		end
	end
end

def isElementInViewpport(webDriver, ele)
	return webDriver.execute_script(VIEWPORTSCRIPTS, ele)
end

def getValueIndex(webDriver, waitor, value, selectorPath)
	index = 1
	elements = waitForElements(webDriver, waitor, selectorPath)
	elements.each do |ele|
		if value == refineElementHtmlTextContent(ele)
			break
		else
			index = index + 1
		end
	end
	return index
end

def focusElement(ele)
	ele.click()
end
