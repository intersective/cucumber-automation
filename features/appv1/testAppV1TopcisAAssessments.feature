Feature: AppV1 topics and assessments
	As a student
	I want to login to the app and do something with topics and assessments
	so that I can experience the program contents
	
	Scenario: Test AppV1 topics and assessments
		Given I go to "https://appdev.practera.com"
		When I wait 10 seconds
		Then "Appv1" I login with the right username with a right password
		Then I should not see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		Then "Appv1" I choose a program "App V1 Selenium Program"
		Then "Appv1" I should see the app home screen
		Then I wait 6 seconds
		Then "Appv1" I can see the current milestone "Comprehensive Milestone" with status "UNLOCKED"
		Then I wait 2 seconds
		Then "Appv1" I go to the "2" tab page
		Then "Appv1" I can see "2" milestones
		Then I wait 2 seconds
		Then "Appv1" I go to the "1" milestone
		Then I wait 3 seconds
		Then "Appv1" I can see "8" assessments and topics
		Then I wait 2 seconds
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I go to the "topic" locating at "1"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I can see the topic with title "Topic 1" and content "This is the content of topic 1"
		Then "Appv1" I go back from topic page
		Then "Appv1" I can see the "assessment" locating at "2" with title "Comprehensive Quiz" and category "assessment"
		Then "Appv1" I go to the "assessment" locating at "2"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I can see the assessment with name "Comprehensive Quiz" and description "This is a comprehensive quiz"
		Then "Appv1" I do the text question locating at "1" with answer "This is the text from Selenium text automation"
		Then I wait 2 seconds
		Then "Appv1" I do the team member selector question locating at "2" with answer "2"
		Then I wait 2 seconds
		Then "Appv1" I do the multiple question locating at "3" with answer "2,3"
		Then I wait 2 seconds
		Then "Appv1" I do the file question locating at "4" with answer "/Users/barrychen/workspace/selenium/upload_file/2017-Scrum-Guide-US.pdf"
		Then I wait 2 seconds
		Then "Appv1" I do the video question locating at "5" with answer "/Users/barrychen/workspace/selenium/upload_file/Video Upload issue 2.mp4"
		Then I wait 2 seconds
		Then "Appv1" I do the image question locating at "6" with answer "/Users/barrychen/workspace/selenium/upload_file/medium-size-dogs-a-medium.jpg"
		Then I wait 2 seconds
		Then "Appv1" I do the video url question locating at "7" with answer "/Users/barrychen/workspace/selenium/upload_file/WhatsApp Video 2017-11-30 at 11.27.14.mp4"
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a pop up" which is located at ".popup"
		Then I click on "cancel button" which is located at ".popup .popup-buttons > button:nth-of-type(1)"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a pop up" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".popup> .popup-buttons > button"
		Then I wait 2 seconds
		Then I click on "the pop up button" which is located at ".modal button"
		Then "Appv1" I go to the "assessment" locating at "3"