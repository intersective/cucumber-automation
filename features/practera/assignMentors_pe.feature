Feature: Practera Assign reviewers for Personal Edge assessment
	As a program admin
	I want to login to Practera platform
	so that I can assign a mentor to review the assessments from students who enrolled in the Personal Edge program

    Scenario: Test Practera Assign reviewers Personal Edge assessment
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "peprogramAdminAccount" and "peprogramAdminAccountPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then "Practera" I go to the "Submissions" page

		Then "Practera" I can assign a mentor to student submissions with:
			| assessment name | mentor name | students |
			| Digital Citizen | mentor | selenium.20180508013454;selenium.20180508013454 |
			| Ethical Leader | mentor | selenium.20180508013454;selenium.20180508013454 |
			| Career Strategist | mentor | selenium.20180508013454;selenium.20180508013454 |
			| Cross-Cultural Team Player | mentor | selenium.20180508013454;selenium.20180508013454 |
			| Creative Thinker | mentor | selenium.20180508013454;selenium.20180508013454 |
			| Confident Communicator | mentor | selenium.20180508013454;selenium.20180508013454 |

		Then "Practera" I log out