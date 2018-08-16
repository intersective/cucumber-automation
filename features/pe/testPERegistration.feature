Feature: Personal Edge Registration
	As a student
	I want to register myself
	so that I can experience the program contents

	Scenario: Test Personal Edge Registration
		Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
		Then "PE" I search email with title "Personal Edge - Welcome and Register" and the student as receiver
		Then "Mailtrap" I go into the email content
		Then I get the registration url at "#btn_registration"
		Then "Mailtrap" I go back to previous frame
		Then I wait 2 seconds
        Then "Mailtrap" I log out
		Then I wait 2 seconds
		Then I use the registration link
		Then I wait 2 seconds
		Then I click on "agree check box" which is located at "ion-checkbox[value=Agree]"
		Then I click on "next button" which is located at ".register-next button"
		Then I should be able to see "login form" which is located at ".general-form" with assert
		Then I input "12341234" to "password filed" which is located at ".general-form ion-input[type=password] input"
		Then I wait 2 seconds
		Then I input "12341234" to "password filed" which is located at ".general-form ion-input[name=verify_password] input"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at ".general-form button"
		Then "PE" I wait for loading finished
		Then I should be able to see "activity list page" which is located at "activities-list-page" with assert
        Then "PE" I log out