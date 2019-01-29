

Then(/^"Appv2" I can see progress ([0-9]|[1-9]+[0-9]*)$/) do |progress|
    progressEle = waitForElement($driver, $wait, "app-home ion-content circle-progress text tspan")
    aprogress = refineElementHtmlTextContent(progressEle)
    verifyValue("expected progress", progress, aprogress)
end