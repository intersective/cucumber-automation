Feature: Mailtrap check emails
	As a admin
	I want to stay notified by the emails
	So that I can see where I am up to and what I should do

    Scenario: Test Mailtrap team email with Mailtrap Api
        Given "Mailtrap Api" I search email with receiver "test.student.20191125153601@practera.com" and title "[ Test experience 20190808220100 ] Submission received for Quiz Assessment 111" with "3" tries
        When "Mailtrap Api" I can see "Please keep this email as confirmation of your submission." in the email content
        Then "Mailtrap Api" I can see "This email is to confirm submission of Quiz Assessment 111 on Practera." in the email content
        When "Mailtrap Api" I search email with title "[ Test experience 20190808220100 ] Submission received for Moderated Assessment 111" and receiver "test.student.20191125153601@practera.com" with "3" tries
        Then "Mailtrap Api" I can see "Hi test.student.20191125153601," in the email content