Feature: API V2 test
	As a cucumber user
	I want to test some v2 api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API V2 test
        Given I call the app "get" api "https://sandbox.practera.com/api/v2/motivations/progress/list.json" by headers "timelineid=587;appkey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
            | model | model_id | result file |
            | project | 556 | v2/motivations/progress/list/success_1.json |
            | milestone | 2405 | v2/motivations/progress/list/success_10.json |
            | activity | 7682 | v2/motivations/progress/list/success_11.json |
            | Topic | 6538 | v2/motivations/progress/list/fail_1.json |
            | task | 2097 | v2/motivations/progress/list/fail_1.json |
        When I call the app "get" api "https://sandbox.practera.com/api/v2/motivations/progress/list.json" by headers "timelineid=587;appkey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
            | model | model_id | scope | result file |
            | project | 556 | project | v2/motivations/progress/list/fail_2.json |
            | project | 556 | milestone | v2/motivations/progress/list/success_2.json |
            | project | 556 | activity | v2/motivations/progress/list/success_4.json |
            | project | 556 | task | v2/motivations/progress/list/success_5.json |
            | milestone | 2405 | project | v2/motivations/progress/list/fail_2.json |
            | milestone | 2405 | milestone | v2/motivations/progress/list/success_8.json |
            | milestone | 2405 | activity | v2/motivations/progress/list/success_3.json |
            | milestone | 2405 | task | v2/motivations/progress/list/success_9.json |
            | activity | 7682 | project | v2/motivations/progress/list/fail_2.json |
            | activity | 7682 | milestone | v2/motivations/progress/list/success_6.json |
            | activity | 7682 | activity | v2/motivations/progress/list/success_7.json |
            | activity | 7682 | task | v2/motivations/progress/list/success_6.json |
        Then I call the app "post" api "https://sandbox.practera.com/api/v2/motivations/progress/create.json" by headers "timelineid=587;appkey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
            | model | model_id | state | result file |
            | Topic | 6538 | started | v2/motivations/progress/create/fail_1.json |
            | Topic | 6538 | completed | v2/motivations/progress/create/success_3.json |
            | Topic | 6974 | started | v2/motivations/progress/create/fail_1.json |
            | Topic | 6974 | stopped | v2/motivations/progress/create/fail_1.json |
        Then I call the app "get" api "https://sandbox.practera.com/api/v2/observation/slider/list.json" by headers "timelineid=587;appkey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
            | team_id | result file |
            | 1140 | v2/observation/slider/list/success_1.json |
        # Then "object" I call the "post" api "http://localhost:8080/api/v2/observation/slider/create.json" by headers "timeline_id=734;appKey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
        #     | api parameters | result file |
        #     | [{"index/choice_id":0,"id":1},{"index/choice_id":1,"id":2}] | v2/observation/slider/create/success_1.json |