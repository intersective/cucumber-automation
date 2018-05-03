Feature: Personal Edge login
	As a student
	I want to login to the app
	so that I can experience the program contents

    Scenario: Test Personal Edge login
        Given I go to PE
        When "PE" I login with username "selenium.20180503165224@practera.com" and password "12341234"
        Then "PE" I wait for loading finished
        Then I should be able to see "activity list page" which is located at "activities-list-page" with assert
        Then "PE" I log out