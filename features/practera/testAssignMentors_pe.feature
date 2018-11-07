Feature: Practera Assign reviewers for Personal Edge assessment
	As a program admin
	I want to login to Practera platform
	so that I can assign a mentor to review the assessments from students who enrolled in the Personal Edge program

    Scenario: Test Practera Assign reviewers Personal Edge assessment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "peprogramAdminAccount" and "peprogramAdminAccountPassword"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "submissions tag" which is located at "//*[text()='Submissions']/../.." with xpath

		Then "Practera" I can assign a mentor to student submissions with:
			| assessment name | mentor name | students |
			| Digital Citizen | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |
			| Ethical Leader | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |
			| Career Strategist | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |
			| Cross-Cultural Team Player | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |
			| Creative Thinker | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |
			| Confident Communicator | selenium_mentor1 | selenium.20180508013454;selenium.20180508013454 |

		Then "Practera" I log out