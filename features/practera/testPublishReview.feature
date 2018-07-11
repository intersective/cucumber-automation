Feature: Practera Publish Reviews
	As a program admin
	I want to login to Practera platform
	so that I can publish an assessment review

    Scenario: Test Practera Publish Reviews
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr" with assert
		Then I click on "ready to publish on moderated assessment" which is located at ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(1) td:nth-of-type(5) > a"
		Then I wait 2 seconds
		Then I should be able to see a group of "reviewed submissions" which is located at "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr"
		Then "Practera" I should see the student ready to publish submission
		Then "Practera" I can publish the student submission review
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr"
		Then I click on "published on moderated assessment" which is located at ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(1) td:nth-of-type(6) > a"
		Then I wait 2 seconds
		Then I should be able to see a group of "published submissions" which is located at "#reviewContainer > div#assessments > div > div#published > div > table > tbody > tr"
		Then "Practera" I can see a student "selenium.20180614221247" submission review with "admin_selenium" publisher
		Then "Practera" I log out