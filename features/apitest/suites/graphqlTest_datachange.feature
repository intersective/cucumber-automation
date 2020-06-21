Feature: Graphql API test
	As a cucumber user
	I want to test some graphql mutation api
	so that I can cover graphql use cases

    Scenario: Graphql API test 1
        Given Practer app v2 api I login with username "student.five@practera.com" and password "El3phant" by "https://stage-test.practera.com/api/auths.json"
        When I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://stage-test.practera.com:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "mutation Mutation{assignReviewer(submissionId:20,reviewerType:\"expert\"){id,status,isDone,meta,reviewer{id,name,email,image}}}" | graphql/7/success_7_1.json |
        When Practer app v2 api I login with username "student.one@practera.com" and password "El3phant" by "https://stage-test.practera.com/api/auths.json"
        And I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://stage-test.practera.com:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "mutation Mutation{handleReview(reviewId:14,acceptance:\"rejected\"){id,status,isDone,meta,reviewer{id,name,email,image}}}" | graphql/7/success_7_2.json |
        When Practer app v2 api I login with username "mentor.one@practera.com" and password "El3phant" by "https://stage-test.practera.com/api/auths.json"
        And I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://stage-test.practera.com:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "mutation Mutation{handleReview(reviewId:14,acceptance:\"accepted\"){id,status,isDone,meta,reviewer{id,name,email,image}}}" | graphql/7/success_7_3.json |