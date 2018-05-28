Feature: API first test
	As a cucumber user
	I want to test some api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API first test
        Given I call the app "post" api "https://sandbox.practera.com/api/auths.json?action=authentication" by headers "appKey=69ad1e66dc;apikey=nil", with:
            | data[User][email] | data[User][password] | result file |
            | selenium.20180409143910@practera.com | 123456123456 | auths/success_1.json |
            | selenium.20180409143910@practera.com | 11111111 | auths/fail_1.json |
        Then I wait 2 seconds
        Then I call the app "post" api "https://sandbox.practera.com/api/auth.json" by headers "appKey=b11e7c189b;apikey=nil", with:
            | data[User][email] | data[User][password] | result file |
            | selenium.20180405173851@practera.com | 12341234 | auth/success_1.json |
            | selenium.20180405173851@practera.com | 11111111 | auth/fail_1.json |
            | selenium.20180329113824@practera.com | 12341234 | auth/success_2.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", with:
            | timeline_id | result file |
            | 587 | team/success_1.json |
            | 586 | team/fail_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", with:
            | milestone_id | project_id | timeline_id | result file |
            | 2405 | 556 | 587 | activities/success_1.json |
            | 2405 | 556 | 586 | activities/fail_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", with:
            | activity_id | timeline_id | result file |
            | 7682 | 587 | sessions/success_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", with:
            | timeline_id | result file |
            | 587 | user_achievements/success_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | timeline_id | result file |
            | 587 | team/success_2.json |
        Then I call the app "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=559bc4dc011b694a9928", with:
            | timeline_id | team_id | result file |
            | 587 | 1138 | team/success_3.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | milestone_id | project_id | timeline_id | result file |
            | [2405,2406] | 556 | 587 | activities/success_2.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | activity_id | timeline_id | result file |
            | [7682,7683] | 587 | sessions/success_2.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | team_id | timeline_id | result file |
            | 1129 | 587 | user_achievements/success_2.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/users.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | timeline_id | result file |
            | 587 | users/success_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/milestone.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | timeline_id | result file |
            | 587 | milestone/success_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", with:
            | target_id | target_model | team_id | timeline_id | result file |
            | 261 | Program | 1129 | 587 | maximum_points/success_1.json |
        Then I wait 2 seconds
        Then I call the app "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", with:
            | target_id | target_model | team_id | timeline_id | result file |
            | 261 | Program | 1129 | 587 | maximum_points/success_2.json |