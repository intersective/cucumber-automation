Feature: Practera Publish Reviews for Personal Edge program
	As a program admin
	I want to login to Practera platform
	so that I can publish an assessment review for Personal Edge program

    Scenario: Test Practera Publish Reviews for Personal Edge program
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "peprogramAdminAccount" and "peprogramAdminAccountPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/.." with xpath
		Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr" with assert
		
		Then "Practera" I can publish the submission reviews with:
			| assessment name | student name |
			| Creative Thinker | selenium.20180508013454;selenium.20180508013454 |
			| Career Strategist | selenium.20180508013454;selenium.20180508013454 |
			| Cross-Cultural Team Player | selenium.20180508013454;selenium.20180508013454 |
			| Ethical Leader | selenium.20180508013454;selenium.20180508013454 |
			| Confident Communicator | selenium.20180508013454;selenium.20180508013454 |
			| Digital Citizen | selenium.20180508013454;selenium.20180508013454 |

		Then "Practera" I log out