Feature: API first test
	As a cucumber user
	I want to test some api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API first test
        Given I call the app "post" api "https://sandbox.practera.com/api/auths.json?action=authentication" with app key "69ad1e66dc" and api key "", should have success and status with:
            | data[User][email] | data[User][password] | success | status |
            | selenium.20180409143910@practera.com | 123456123456 | true | success |
            | selenium.20180409143910@practera.com | 11111111 | false | auth_error |
        Then I wait 2 seconds
        Then I call the app "post" api "https://sandbox.practera.com/api/auth.json" with app key "b11e7c189b" and api key "", should have success and status with:
            | data[User][email] | data[User][password] | success | status |
            | selenium.20180405173851@practera.com | 12341234 | true | success |
            | selenium.20180405173851@practera.com | 11111111 | false | auth_error |
            | selenium.20180329113824@practera.com | 12341234 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
            | 586 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/activities.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", should have success and status with:
            | milestone_id | project_id | timeline_id | success | status |
            | 2405 | 556 | 587 | true | success |
            | 2405 | 556 | 586 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/sessions.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", should have success and status with:
            | activity_id | timeline_id | success | status |
            | 7682 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/user_achievements.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/activities.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | milestone_id | project_id | timeline_id | success | status |
            | [2405,2406] | 556 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/sessions.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | activity_id | timeline_id | success | status |
            | [7682,7683] | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/user_achievements.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | team_id | timeline_id | success | status |
            | 1129 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/users.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/milestone.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/maximum_points.json" with app key "b11e7c189b" and api key "64a6d1ff98a22b0f4940", should have success and status with:
            | target_id | target_model | team_id | timeline_id | success | status |
            | 261 | Program | 1129 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/maximum_points.json" with app key "b11e7c189b" and api key "cf2f8016c2a5a3d4608f", should have success and status with:
            | target_id | target_model | team_id | timeline_id | success | status |
            | 261 | Program | 1129 | 587 | true | success |