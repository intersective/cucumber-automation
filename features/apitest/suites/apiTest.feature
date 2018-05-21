Feature: API test
	As a cucumber user
	I want to test some api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API first test
        Given I call the "post" api "https://sandbox.practera.com/api/auths.json?action=authentication" by headers "appKey=69ad1e66dc;apikey=nil", should have success and status with:
            | data[User][email] | data[User][password] | success | status |
            | selenium.20180409143910@practera.com | 123456123456 | true | success |
            | selenium.20180409143910@practera.com | 11111111 | false | auth_error |
        Then I wait 2 seconds
        Then I call the "post" api "https://sandbox.practera.com/api/auth.json" by headers "appKey=b11e7c189b;apikey=nil", should have success and status with:
            | data[User][email] | data[User][password] | success | status |
            | selenium.20180405173851@practera.com | 12341234 | true | success |
            | selenium.20180405173851@practera.com | 11111111 | false | auth_error |
            | selenium.20180329113824@practera.com | 12341234 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
            | 586 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | milestone_id | project_id | timeline_id | success | status |
            | 2405 | 556 | 587 | true | success |
            | 2405 | 556 | 586 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | activity_id | timeline_id | success | status |
            | 7682 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/teams.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/activities.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | milestone_id | project_id | timeline_id | success | status |
            | [2405,2406] | 556 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/sessions.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | activity_id | timeline_id | success | status |
            | [7682,7683] | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | team_id | timeline_id | success | status |
            | 1129 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/users.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/milestone.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | timeline_id | success | status |
            | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | target_id | target_model | team_id | timeline_id | success | status |
            | 261 | Program | 1129 | 587 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/maximum_points.json" by headers "appKey=b11e7c189b;apikey=cf2f8016c2a5a3d4608f", should have success and status with:
            | target_id | target_model | team_id | timeline_id | success | status |
            | 261 | Program | 1129 | 587 | true | success |
        Then I call the "get" api "https://sandbox.practera.com/api/items.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | character_id | filter | success | status |
            | 734 | 655 | all | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/events.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | type | activity_id | success | status |
            | 734 | session | [7655,7656,7657,7658,7659,7660,7661] | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | success | status |
            | 734 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | game_id | action | period | character_id | success | status |
            | 734 | 1 | ranking | monthly | 655 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | game_id | action | period | success | status |
            | 734 | 1 | ranking | monthly | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/characters" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | game_id | success | status |
            | 734 | 1 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/achievements.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | success | status |
            | 734 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/submissions.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | context_id | success | status |
            | 734 | 2537 | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/assessments.json" by headers "timelineID=734;appkey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | assessment_id | structured | success | status |
            | 734 | 2068 | true | true | success |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "timelineID=734;appKey=b11e7c189b;apikey=64a6d1ff98a22b0f4940", should have success and status with:
            | timelineID | success | status |
            | 734 | false | unauthorized |
        Then I wait 2 seconds
        Then I call the "get" api "https://sandbox.practera.com/api/user_achievements.json" by headers "timelineID=734;appKey=69ad1e66dc;apikey=b9b3537864043b34cb4a", should have success and status with:
            | timelineID | success | status |
            | 734 | true | success |