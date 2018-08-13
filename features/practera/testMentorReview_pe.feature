Feature: Practera Mentor Review for Personal Edge
	As a program mentor
	I want to login to Practera platform
	so that I can review student submissions for Personal Edge program

    Scenario: Test Practera Mentor Review for Personal Edge
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "selenium_mentor1@test.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "reviews and feedback tag" which is located at "//*[text()='Reviews & Feedback']/.." with xpath
		Then I wait 2 seconds
		Then I click on "my reviews tag" which is located at "//*[text()='Reviews & Feedback']/../..//*[normalize-space()='My Reviews']" with xpath
		Then I should be able to see a group of "to review submission" which is located at "#toreview tbody tr"
		
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