Feature: AppV2 topics
	As a student
	I want to login to the app and do something with topics
	so that I can experience the program contents

	Scenario: Test AppV2 topics
		Given I go to App V2
		When "Appv2" I login with the student account and password "studentPassword"
		Then "Appv2" I choose a program "App V2 Automation Program"
		Then "Appv2" I wait for loading finished
		Given "Appv2" I go to the "Activities" tab page
		When "Appv2" I go to the "Comprehensive Activity" activity
		Then "Appv2" I can see the activity name "Comprehensive Activity" and description "Comprehensive Activity Description"
		Given "Appv2" I go to the topic "Topic 1"
		When "Appv2" I wait for loading finished
		Then "Appv2" I go back from topic page
		Then "Appv2" I wait for loading finished
		Given "Appv2" I go to the topic "Topic 1"
		When "Appv2" I wait for loading finished
		Then I click on "mark topic as read" which is located at "//span[normalize-space()='Mark topic as read']/../ion-toggle" with xpath
		Then "Appv2" I go back from topic page
		Then "Appv2" I wait for loading finished
		Then "Appv2" I can see the "Topic 1" with status "Topic done"
		Then "Appv2" I log out