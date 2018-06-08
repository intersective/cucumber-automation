Feature: API V2 test
	As a cucumber user
	I want to test some v2 api
	so that I can cover some test cases regardless the UI interactions

    Scenario: API V2 test for Appv1 Selenium program in Appv1 test experience 2(selenium.20180608094300@practera.com)
        Given I call the app "get" api "https://sandbox.practera.com/api/v2/motivations/progress/list.json" by headers "timelineid=763;appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | model | model_id | result file |
            | project | 605 | v2/motivations/progress/list/success_1.json |
            | milestone | 2549 | v2/motivations/progress/list/success_10.json |
            | activity | 8092 | v2/motivations/progress/list/success_11.json |
            | Topic | 8943 | v2/motivations/progress/list/fail_1.json |
        When I call the app "get" api "https://sandbox.practera.com/api/v2/motivations/progress/list.json" by headers "timelineid=763;appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | model | model_id | scope | result file |
            | project | 605 | project | v2/motivations/progress/list/fail_2.json |
            | project | 605 | milestone | v2/motivations/progress/list/success_2.json |
            | project | 605 | activity | v2/motivations/progress/list/success_4.json |
            | project | 605 | task | v2/motivations/progress/list/success_5.json |
            | milestone | 2549 | project | v2/motivations/progress/list/fail_2.json |
            | milestone | 2549 | milestone | v2/motivations/progress/list/success_8.json |
            | milestone | 2549 | activity | v2/motivations/progress/list/success_3.json |
            | milestone | 2549 | task | v2/motivations/progress/list/success_9.json |
            | activity | 8092 | project | v2/motivations/progress/list/fail_2.json |
            | activity | 8092 | milestone | v2/motivations/progress/list/fail_3.json |
            | activity | 8092 | activity | v2/motivations/progress/list/success_7.json |
            | activity | 8092 | task | v2/motivations/progress/list/success_6.json |
        Then I call the app "post" api "https://sandbox.practera.com/api/v2/motivations/progress/create.json" by headers "timelineid=763;appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | model | model_id | state | result file |
            | Topic | 8943 | started | v2/motivations/progress/create/fail_1.json |
            | Topic | 8943 | completed | v2/motivations/progress/create/success_3.json |
            | Topic | 6974 | started | v2/motivations/progress/create/fail_1.json |
            | Topic | 6974 | stopped | v2/motivations/progress/create/fail_1.json |
        Then I call the app "get" api "https://sandbox.practera.com/api/v2/observation/slider/list.json" by headers "appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | timeline_id | result file |
            | 763 | v2/observation/slider/list/success_4.json |
        Then "object" I call the "post" api "https://sandbox.practera.com/api/v2/observation/slider/create?timeline_id=763" by headers "appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4;Content-Type=application/json", with:
            | api parameters | result file |
            | [{"id":"7","choice_id":null},{"id":"8","choice_id":null},{"id":"9","choice_id":null}] | v2/observation/slider/create/success_1.json |
            | [{"id":"1","choice_id":null},{"id":"8","choice_id":null},{"id":"9","choice_id":null}] | v2/observation/slider/create/fail_1.json |
        Then I call the app "get" api "https://sandbox.practera.com/api/v2/plan/experience/config" by headers "appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | domain | timeline_id | result file |
            | appdev.practera.com | 763 | v2/plan/experience/config/success_1.json |
        Then I call the app "get" api "https://sandbox.practera.com/api/v2/plan/experience/config" by headers "appkey=b11e7c189b;apikey=b96e61c911cc9bc095e4", with:
            | domain | result file |
            | appdev.practera.com | v2/plan/experience/config/success_1.json |
            | 127.0.0.1:8888 | v2/plan/experience/config/success_2.json |

    Scenario: API V2 test for Generic App program (test.barry@practera.com)
        When I call the app "get" api "https://sandbox.practera.com/api/v2/observation/slider/list.json" by headers "appkey=b11e7c189b;apikey=130fed6d9bd213a644b5", with:
            | timeline_id | result file |
            | 585 | v2/observation/slider/list/success_2.json |

    Scenario: API V2 test for Appv1 Selenium program
        When I call the app "get" api "https://sandbox.practera.com/api/v2/observation/slider/list.json" by headers "appkey=b11e7c189b;apikey=6bcfa5a817f3e9ba7130", with:
            | timeline_id | result file |
            | 587 | v2/observation/slider/list/success_1.json |

    Scenario: API V2 test for Appv1 Selenium program in Appv1 selenium experience(selenium.20180523170502@practera.com)
        When I call the app "get" api "https://sandbox.practera.com/api/v2/observation/slider/list.json" by headers "appkey=b11e7c189b;apikey=3056276aafe93845e2f2", with:
            | timeline_id | result file |
            | 763 | v2/observation/slider/list/success_3.json |
        Then "object" I call the "post" api "https://sandbox.practera.com/api/v2/observation/slider/create?timeline_id=763" by headers "appkey=b11e7c189b;apikey=3056276aafe93845e2f2;Content-Type=application/json", with:
            | api parameters | result file |
            | [{"id":"7","choice_id":3},{"id":"8","choice_id":2},{"id":"9","choice_id":2},{"id":"10","choice_id":2}] | v2/observation/slider/create/success_1.json |