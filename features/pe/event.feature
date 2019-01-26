@Feature
Feature: Personal Edge studfent book and cancel event
	As a student
	I want to book an event
	so that I can attend the event afterwards

    Scenario: Test ractera create an event in a timeline
		Given I go to PE
		When "PE" I login with username "#(user)" and password "#(password1)"
        Then "PE" I wait for loading finished
		Then I can see "activity list page" which is located at "activities-list-page"
		Then I click on "Event tab" which is located at "#tab-t0-1"
		Then "PE" I wait for loading finished
		Then I will see a group of "buttons" with total "3" which is located at "events-list-page ion-grid ion-row:nth-of-type(1) ion-segment-button"
		Then I click on "Browse" which is located at "events-list-page ion-grid ion-row:nth-of-type(1) ion-segment-button:nth-of-type(1)"
		Then I wait 2 seconds
		Then "PE" I go to the event page
		Then I click on "book button" which is located at "button.book-btn"
		Then I wait 2 seconds
		Then I can see "pop up" which is located at ".action-sheet-container"
		Then I click on "cancel button" which is located at ".action-sheet-container .action-sheet-cancel"
		Then I wait 2 seconds
		Then I click on "back button" which is located at ".show-back-button"
		Then I wait 2 seconds
		Then "PE" I wait for loading finished
		Then I wait 2 seconds
		Then "PE" I check the event is still here
		Then "PE" I go to the event page
		Then I click on "book button" which is located at "button.book-btn"
		Then I wait 2 seconds
		Then I can see "pop up" which is located at ".action-sheet-container"
		Then I click on "confirm button" which is located at ".action-sheet-container .action-sheet-title + .action-sheet-button"
		Then "PE" I wait for loading finished
		Then I wait 2 seconds
		Then "PE" I wait for loading finished
		Then I click on "Bookings category" which is located at "events-list-page ion-grid ion-row:nth-of-type(1) ion-segment-button:nth-of-type(2)"
		Then I wait 2 seconds
		Then "PE" I check the event is still here
		Then "PE" I go to the event page
		Then I wait 2 seconds
		Then "PE" I wait for loading finished
		Then "PE" I can see the event check in button being not disabled
		Then I click on "back button" which is located at ".show-back-button"
		Then I wait 2 seconds
		Then "PE" I wait for loading finished
		Then I wait 2 seconds
		Then "PE" I log out