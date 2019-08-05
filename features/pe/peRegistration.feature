Feature: Personal Edge Registration
	As a student
	I want to register myself
	so that I can experience the program contents

	Scenario: Test Personal Edge Registration
		Given I go to Mailtrap
        When "Mailtrap" I login with username "#(mailtrapUser)" and password "#(mailtrapUserPassword)"
        Then "Mailtrap" I go to "practera-sandbox" inbox
		Then "Mailtrap" I search email with title "Personal Edge 1.0 - Welcome and Register" and the student as receiver
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
		Then I should see "login form" which is located at ".general-form"
		Then I input "#(password1)" to "password filed" which is located at ".general-form ion-input[type=password] input"
		Then I wait 2 seconds
		Then I input "#(password1)" to "password filed" which is located at ".general-form ion-input[name=verify_password] input"
		Then I wait 2 seconds
		Then I click on "submit button" which is located at ".general-form button"
		Then "PE" I wait for loading finished
		Then I should see "activity list page" which is located at "activities-list-page"
        Then "PE" I log out