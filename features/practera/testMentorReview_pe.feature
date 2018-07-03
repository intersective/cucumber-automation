Feature: Practera Mentor Review for Personal Edge
	As a program mentor
	I want to login to Practera platform
	so that I can review student submissions for Personal Edge program

    Scenario: Test Practera Mentor Review for Personal Edge
		Given I go to Practera Platform
		When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "selenium_mentor1@test.com" and password "12341234"
		Then I should be able to see "a side bar" which is located at "#sidebar"
		Then I click on "a tag" which is located at "#sidebar ul.nav li:nth-of-type(4) a"
		Then I wait 2 seconds
		Then I click on "a tag" which is located at "ul.nav li:nth-of-type(4) > ul > li > a"
		Then I should be able to see a group of "to review submission" which is located at "div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row"
		
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