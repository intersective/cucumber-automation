Feature: AppV1 Check Team Assessment
	As a student
	I want to login to the app and check the answers of a team assessment
	so that I can review the work from our team
	
	Scenario: Test AppV1 Check Team Assessment
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student2" and password "studentPassword" and domain "practera.com"
		Then "Appv1" I should see the app home screen
		When I wait until the loading finished
		Then "Appv1" I go to the "Activity 2" activity page which has "3" items
		Then "Appv1" I can see the "assessment" locating at "3" with title "Appv1 test automation team assessment" and category "assessment"
		Then "Appv1" I go to the assessment locating at "3"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then I should see "text answers" which is located at "//*[@ng-repeat='question in group.questions'][1]//*[@ng-if='isDone']/*[text()='we are working well']" with xpath scroll
		Then I should see "choice answer" which is located at "//*[@ng-repeat='question in group.questions'][2]//*[@ng-if='isDone']//*[text()='Choice Two']" with xpath scroll
		Then I wait 2 seconds
		When "Appv1" I go back from assessment page
		Then "Appv1" I log out