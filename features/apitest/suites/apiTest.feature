Feature: API test
	As a cucumber user
	I want to test some api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API test
        Given I call the "post" api "https://sandbox.practera.com/api/auths.json?action=authentication" by headers "appKey=69ad1e66dc;apikey=nil", should have keys equal with:
            | data[User][email] | data[User][password] | keys | values |
            | selenium.20180409143910@practera.com | 123456123456 | success&status | true&success |
            | selenium.20180409143910@practera.com | 11111111 | success&status | false&auth_error |
        Then I wait 2 seconds
        Then I call the "post" api "https://sandbox.practera.com/api/auth.json" by headers "appKey=b11e7c189b;apikey=nil", should have keys equal with:
            | data[User][email] | data[User][password] | keys | values |
            | selenium.20180405173851@practera.com | 12341234 | success&status | true&success |
            | selenium.20180405173851@practera.com | 11111111 | success&status | false&auth_error |
            | selenium.20180329113824@practera.com | 12341234 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | timeline_id | keys | values |
            | 587 | success&status | true&success |
            | 586 | success&status | false&unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | milestone_id | project_id | timeline_id | keys | values |
            | 2405 | 556 | 587 | success&status | true&success |
            | 2405 | 556 | 586 | success&status | false&unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | activity_id | timeline_id | keys | values |
            | 7682 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | timeline_id | keys | values |
            | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | timeline_id | keys | values |
            | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | milestone_id | project_id | timeline_id | keys | values |
            | [2405,2406] | 556 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | activity_id | timeline_id | keys | values |
            | [7682,7683] | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | team_id | timeline_id | keys | values |
            | 1129 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/users.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | timeline_id | keys | values |
            | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/milestone.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | timeline_id | keys | values |
            | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | target_id | target_model | team_id | timeline_id | keys | values |
            | 261 | Program | 1129 | 587 | success&status | true&success |
            | 261 | Program | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have keys equal with:
            | target_id | target_model | team_id | timeline_id | keys | values |
            | 261 | Program | 1129 | 587 | success&status | true&success |
        Then I call the "get" api "https://sandbox.practera.com/api/items.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | character_id | filter | keys | values |
            | 734 | 655 | all | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/events.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | type | activity_id | keys | values |
            | 734 | session | [7655,7656,7657,7658,7659,7660,7661] | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | keys | values |
            | 734 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | game_id | action | period | character_id | keys | values |
            | 734 | 1 | ranking | monthly | 655 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | game_id | action | period | keys | values |
            | 734 | 1 | ranking | monthly | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | game_id | keys | values |
            | 734 | 1 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/achievements.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | keys | values |
            | 734 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | context_id | keys | values |
            | 734 | 2537 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/assessments.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | assessment_id | structured | keys | values |
            | 734 | 2068 | true | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "timelineID=734;appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have keys equal with:
            | timelineID | keys | values |
            | 734 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have keys equal with:
            | timelineID | keys | values |
            | 734 | success&status | true&success |
        Then I wait 2 seconds
        Then "Json" I call the "post" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should equal with:
            | json parameters | keys in header | keys | result file |
            | {"Character":{"id":655,"meta":{"private":0}}} | | |characters/success_1.json |
            | {"Character":{"id":655,"meta":{"private":1}}} | | |characters/success_2.json |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | sentiment| team_id | timeline_id | keys | values |
            | false | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/stories.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | model_id | team_id | timeline_id | keys | values |
            | [6538] | 1138 | 587 | success&status | true&success |
            | 6538 | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/assessments.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | team_id | timeline_id | keys | values |
            | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | team_id | timeline_id | keys | values |
            | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | activity_id | team_id | timeline_id | keys | values |
            | [7682,7683] | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/export_assessments.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | assessment_id | team_id | timeline_id | keys | values |
            | 2225 | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | assessment_id | sentiment| team_id | timeline_id | keys | values |
            | 2225 | false | 1138 | 587 | success&status | true&success |
            | 2287 | false | 1138 | 587 | success&status | true&success |
        Then I wait 2 seconds
        Then I call the "post" api "https://sandbox.practera.com/api/auth.json?team_id=1138&timeline_id=587" by headers "appkey=b11e7c189b;apikey=f16232310551a3d4d035", should have keys equal with:
            | data[User][email] | data[User][password] | keys | values |
            | selenium.20180503165632@practera.com | 12341234 | success&status | true&success |