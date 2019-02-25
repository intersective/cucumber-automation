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

private def find_element(webDriver, selectorPath, selectorType=Application.KEY_CSS)
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

def find_element_with_parent(parentEle, selectorPath, selectorType=Application.KEY_CSS)
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

def wait_element_with_parent(waitor, parentEle, selectorPath, selectorType=Application.KEY_CSS)
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

def wait_for_element(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:css => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def wait_for_element_xpath(webDriver, waitor, selectorPath)
	begin
		return waitor.until { webDriver.find_element(:xpath => selectorPath) }
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def wait_for_elements_xpath(webDriver, waitor, selectorPath)
	begin
		waitor.until { webDriver.find_elements(:xpath => selectorPath).length > 0 }
		return webDriver.find_elements(:xpath => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def wait_for_elements(webDriver, waitor, selectorPath)
	begin
		waitor.until { webDriver.find_elements(:css => selectorPath).length > 0 }
		return webDriver.find_elements(:css => selectorPath)
	rescue Exception => e
		$testLogger1.error(e.message)
	end
	return nil
end

def wait_for_element_visible(webDriver, waitor, selectorPath)
	counter = 0
	while counter < $visibleWait
		ele = wait_for_element(webDriver, waitor, selectorPath)
		if ele == nil || ele.displayed?
			break
		end
		counter = counter + 1
		sleep 1
	end
	return find_element(webDriver, selectorPath)
end

def wait_for_element_visible_xpath(webDriver, waitor, selectorPath)
	counter = 0
	while counter < $visibleWait
		ele = wait_for_element_xpath(webDriver, waitor, selectorPath)
		if ele == nil || ele.displayed?
			break
		end
		counter = counter + 1
		sleep 1
	end
	return find_element(webDriver, selectorPath, Application.KEY_XPATH)
end

def wait_toast_message_disappear(webDriver, waitor)
	sleep 1
	while wait_for_element(webDriver, waitor, ".toast-message" ) != nil
		sleep 1
	end
end

def refine_element_text_content(ele)
	return ele.attribute("innerText").gsub("\n", "").strip
end

def refine_element_html_text_content(ele)
	return ele.attribute("textContent").gsub("\n", "").strip
end

def wait_for_load_finished(webDriver, waitor)
	while wait_for_element(webDriver, waitor, ".loading-container").attribute("class").index("active") != nil
		sleep 1
	end
	clickBlock = wait_for_element(webDriver, waitor, ".click-block")
	if clickBlock != nil
		while clickBlock.attribute("class").index("click-block-active") != nil
			sleep 1
			clickBlock = wait_for_element(webDriver, waitor, ".click-block")
		end
	end
	sleep 2
end

def wait_for_element_visible_withIn_a_group(webDriver, waitor, selectorPath, index)
	counter = 0
	i = index.to_i - 1
	elements = wait_for_elements(webDriver, waitor, selectorPath)
	while counter < $visibleWait && !elements[i].displayed?
		counter = counter + 1
		sleep 1
		elements = wait_for_elements(webDriver, waitor, selectorPath)
	end
	return elements[i]
end

def scroll_if_not_visible(webDriver, ele)
	while !ele.displayed?
		webDriver.action.move_to(ele).perform
		sleep 1
	end
end

def scroll_by_keyboard_if_not_visible(webDriver, parentEle, ele)
	inViewport = is_element_in_viewpport(webDriver, ele)
	if !inViewport
		$driver.action.move_to(parentEle, 15, 15).perform
		$driver.action.click().perform
		while !inViewport
			webDriver.action.send_keys(:arrow_down).perform
			sleep 1
			inViewport = is_element_in_viewpport(webDriver, ele)
		end
	end
end

def is_element_in_viewpport(webDriver, ele)
	return webDriver.execute_script(VIEWPORTSCRIPTS, ele)
end

def get_value_index(webDriver, waitor, value, selectorPath)
	index = 1
	elements = wait_for_elements(webDriver, waitor, selectorPath)
	elements.each do |ele|
		if value == refine_element_html_text_content(ele)
			break
		else
			index = index + 1
		end
	end
	return index
end

def focus_element(ele)
	ele.click()
end
