Feature: AppV1 Check Team Assessment
	As a student
	I want to login to the app and check the answers of a team assessment
	so that I can review the work from our team
	
	Scenario: Test AppV1 Check Team Assessment
		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with username "selenium.20180614215353@practera.com" and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity 2" activity page which has "3" items
		Then "Appv1" I can see the "assessment" locating at "3" with title "Appv1 test automation team assessment" and category "assessment"
		Then "Appv1" I go to the assessment locating at "3"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I should be able to see "selenium.20180614215353 is working with us" which is located at "//*[@ng-repeat='question in group.questions'][1]//*[@ng-if='isDone']"
		Then "Appv1" I should be able to see "Choice Two" which is located at "//*[@ng-repeat='question in group.questions'][2]//*[@ng-if='isDone']"
		Then I wait 2 seconds
		Then "Appv1" I go back from assessment page
		Then "Appv1" I log out