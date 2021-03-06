@Feature
Feature: Personal Edge login
	As a student
	I want to login to the app
	so that I can experience the program contents

    Scenario: Test Personal Edge login
        Given I go to PE
        When "PE" I login with username "#(user)" and password "#(password1)"
        Then "PE" I wait for loading finished
        Then I should see "activity list page" which is located at "activities-list-page"
        Then "PE" I log out