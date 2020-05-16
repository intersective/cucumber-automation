Feature: Graphql API test
	As a cucumber user
	I want to test some graphql api
	so that I can cover graphql query use cases

    Scenario: Graphql API test get an activity contents 1
        When I call the apis with:
            | api menthod | api endpoint | api request header | data format | parameters | keys in header | keys | result file |
            | post | http://localhost:8080/api/auths.json | appKey=b11e7c189b | Json | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain | Graphql | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_1.json |

    Scenario: Graphql API test get an activity contents 2
        When I call the apis with:
            | api menthod | api endpoint | api request header | data format | query text | keys in header | keys | result file |
            | post | http://localhost:8080/api/auths.json | appKey=b11e7c189b | Json | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain | Graphql | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_2.json |

    Scenario: Graphql API test get an activity contents 3
        When I call the apis with:
            | api menthod | api endpoint | api request header | data format | query text | keys in header | keys | result file |
            | post | http://localhost:8080/api/auths.json | appKey=b11e7c189b | Json | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain | Graphql | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_3.json |