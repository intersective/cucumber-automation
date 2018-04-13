Feature: API first test
	As a cucumber user
	I want to test some api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API first test
        Given I call the app "post" api "https://sandbox.practera.com/api/auths.json?action=authentication" with app key "69ad1e66dc" and api key "", with:
            | data[User][email] | data[User][password] | result file |
            | selenium.20180409143910@practera.com | 12341234 | auth/success_1.json |
            | selenium.20180409143910@practera.com | 11111111 | auth/fail_1.json |
        Then I wait 2 seconds
        Then I call the app "post" api "https://sandbox.practera.com/api/auth.json" with app key "b11e7c189b" and api key "", with:
            | data[User][email] | data[User][password] | result file |
            | selenium.20180405173851@practera.com | 12341234 | auth/success_2.json |
            | selenium.20180405173851@practera.com | 11111111 | auth/fail_2.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", with:
            | timeline_id | result file |
            | 587 | team/success_1.json |
            | 586 | team/fail_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/activities.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", with:
            | milestone_id | project_id | timeline_id | result file |
            | 2405 | 556 | 587 | activities/success_1.json |
            | 2405 | 556 | 586 | activities/fail_1.json |