Feature: Graphql API test
	As a cucumber user
	I want to test some graphql api
	so that I can cover graphql query use cases

    Scenario: Graphql API test get an activity contents
        Given "Json" I call the "post" api "http://localhost:8080/api/auths.json" by headers "appKey=b11e7c189b", and set keys with:
            | parameters | keys in header | keys | result file |
            | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
            | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
            | {"User" : {"email" : "mentor.one@practera.com","password" :"El3phant"}} | | data/apikey | |
        Then "Graphql" I call the "post" api "http://localhost:8000" by headers "appkey=b11e7c189b;Content-Type=application/plain", should equal with:
            | query text | keys in header | keys | result file |
            | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_1.json |
            | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_2.json |
            | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | apikey=data/apikey | | graphql/activity/success_3.json |