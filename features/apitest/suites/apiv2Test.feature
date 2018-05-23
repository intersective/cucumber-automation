Feature: API V2 test
	As a cucumber user
	I want to test some v2 api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API V2 test
        Given I call the app "get" api "http://localhost:8080/api/v2/motivations/progress/list.json" by headers "appKey=b11e7c189b;apikey=da26cb1fe019b47b4729", with:
            | model | model_id | result file |
            | project | 23 | v2/motivations/progress/list/success_1.json |
            | topic | 123 | v2/motivations/progress/list/success_6.json |
        When I call the app "get" api "http://localhost:8080/api/v2/motivations/progress/list.json" by headers "appKey=b11e7c189b;apikey=da26cb1fe019b47b4729", with:
            | model | model_id | scope | result file |
            | project | 23 | milestone | v2/motivations/progress/list/success_2.json |
            | milestone | 242 | activity | v2/motivations/progress/list/success_3.json |
            | project | 23 | activity | v2/motivations/progress/list/success_4.json |
            | project | 23 | task | v2/motivations/progress/list/success_5.json |
        Then I call the app "post" api "http://localhost:8080/api/v2/motivations/progress/create.json" by headers "appKey=b11e7c189b;apikey=da26cb1fe019b47b4729", with:
            | model | model_id | state | result file |
            | Topic | 123 | started | v2/motivations/progress/create/success_1.json |
            | Topic | 124 | stopped | v2/motivations/progress/create/success_2.json |
            | Topic | 125 | completed | v2/motivations/progress/create/success_3.json |
        Then I call the app "get" api "http://localhost:8080/api/v2/observation/slider/list.json" by headers "appKey=b11e7c189b;apikey=da26cb1fe019b47b4729", with:
            | timeline_id | team_id | result file |
            | 734 | 1138 | v2/observation/slider/list/success_1.json |
        Then "object" I call the "post" api "http://localhost:8080/api/v2/observation/slider/create.json" by headers "timeline_id=734;appKey=b11e7c189b;apikey=da26cb1fe019b47b4729", with:
            | api parameters | result file |
            | [{"index/choice_id":0,"id":1},{"index/choice_id":1,"id":2}] | v2/observation/slider/create/success_1.json |