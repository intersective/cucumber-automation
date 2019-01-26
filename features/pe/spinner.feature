@Feature
Feature: Personal Edge Spin Wheel
	As a student
	I want to login to the app
	so that I can spin the wheel and earn points

    Scenario: Test Personal Edge Spin Wheel
        Given I go to PE
        When "PE" I login with username "#(user)" and password "#(password1)"
        Then "PE" I wait for loading finished
        Then I should see "activity list page" which is located at "activities-list-page"
        Then I click on "spinner tab" which is located at "#tab-t0-3"
        Then I can see "spinner page" which is located at "#tabpanel-t0-3[aria-hidden=false]"
        Then I should see "a wheel" which is located at "canvas#spinwheel"
        Then "PE" I check that the spin chances on the page should equal to the number on the tab
        Then "PE" I click on the spinner wheel
        Then "PE" I check that the points on the dashboard equal to points on the spinner page
        Then "PE" I log out