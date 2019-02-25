

Then(/^"Appv2" I can see progress ([0-9]|[1-9]+[0-9]*)$/) do |progress|
    progressEle = wait_for_element($driver, $wait, "app-home ion-content circle-progress text tspan")
    aprogress = refine_element_html_text_content(progressEle)
    verify_value("expected progress", progress, aprogress)
end