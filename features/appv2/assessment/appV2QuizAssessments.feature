Feature: AppV2 quiz assessment
	As a student
	I want to login to the app and do something with quiz assessment
	so that I can experience the program contents

    Scenario: Test AppV2 quiz assessment
        Given I go to App V2
        When "Appv2" I login with username "selenium.student.201901230438419c21705242d2@practera.com" and password "grF57ZNUBwhX8W82&pt9a%-kvc5h+AnGcQ!"
        Then "Appv2" I choose a program "App V2 Automation Program"
        Then "Appv2" I wait for loading finished
        Given "Appv2" I go to the "Activities" tab page
        When "Appv2" I go to the "Comprehensive Activity" activity
        Then "Appv2" I go to the assessment "Comprehensive Quiz"
        Then "Appv2" I wait for loading finished
        Then "Appv2" I can see the assessment with name "Comprehensive Quiz" and description "This is a comprehensive quiz"
        Then "Appv2" I can see 1 question group name "Text Questions" and description "Comprehensive Quiz Text Questions Group description"
        Then "Appv2" I can see 1 question name "Text Question 1" and description "Comprehensive Quiz Text Question 1 description"
        Then "Appv2" I answer "ohhh gogoggoo" for 1 question with question type "text"
        Then "Appv2" I go back from assessment page
        Then "Appv2" I wait for loading finished
        Then "Appv2" I log out
