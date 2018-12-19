Feature: Practera Mentor Review for Personal Edge
	As a program mentor
	I want to login to Practera platform
	so that I can review student submissions for Personal Edge program

    Scenario: Test Practera Mentor Review for Personal Edge
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "mentorAccount" and "mentorAccountPassword"
		Then I can see "a side bar" which is located at "#sidebar"
		Then "Practera" I go to the "Reviews & Feedback" page
		Then I wait 2 seconds
		Then "Practera" I go to the "My Reviews" page
		Then I will see a group of "to review submission" which is located at "#toreview tbody tr"
		
		Then "Practera" I can do the review with:
			| assessment name | student name |
			| Creative Thinker | selenium.20180508013454 |
			| Creative Thinker | selenium.20180508013454 |
			| Career Strategist | selenium.20180508013454 |
			| Career Strategist | selenium.20180508013454 |
			| Cross-Cultural Team Player | selenium.20180508013454 |
			| Cross-Cultural Team Player | selenium.20180508013454 |
			| Ethical Leader | selenium.20180508013454 |
			| Ethical Leader | selenium.20180508013454 |
			| Confident Communicator | selenium.20180508013454 |
			| Confident Communicator | selenium.20180508013454 |
			| Digital Citizen | selenium.20180508013454 |
			| Digital Citizen | selenium.20180508013454 |

		Then "Practera" I log out