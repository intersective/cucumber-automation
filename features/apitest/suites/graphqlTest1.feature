Feature: Graphql API test
	As a cucumber user
	I want to test some graphql api
	so that I can cover graphql query use cases

    Scenario: Graphql API test 1
        Given Practer app v2 api I login with username "student.one@practera.com" and password "El3phant" by "http://localhost:8080/api/auths.json"
        When I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:72,reviewer:false,activityId:51) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:1) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_2.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:2) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_3.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{milestones{id name progress description isLocked activities{id name progress isLocked leadImage }}}" | graphql/1/success_1_4.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/1/success_1_5.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:46){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/1/success_1_6.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:59,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_7.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:59,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:7) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_8.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:65,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_9.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:65,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:9) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_10.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:57,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_11.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:57,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:12) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_12.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:63,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_13.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:63,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:13) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_14.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_15.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:16) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_16.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:61,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/4/success.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:62,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/4/success_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:61,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:5) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/4/success_2.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:62,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:4) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/4/success_3.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:81,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/5/success.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:81,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:6) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/5/success_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:50){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/1/success_1_17.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activities(tagId:7,type:\"learnflow\"){id name description isLocked leadImage progress}}" | graphql/1/success_1_18.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activities(tagId:7){id name description isLocked leadImage progress}}" | graphql/1/success_1_19.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/1/success_1_20.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:8) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/1/success_1_21.json |

    Scenario: Graphql API test 2
        Given Practer app v2 api I login with username "student.two@practera.com" and password "El3phant" by "http://localhost:8080/api/auths.json"
        When I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:72,reviewer:false,activityId:51) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:2) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_2.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:60,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:1) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_3.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{milestones{id name progress description isLocked activities{id name progress isLocked leadImage }}}" | graphql/2/success_2_4.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/2/success_2_5.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:46){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/2/success_2_6.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:59,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2_7.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:59,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:7) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_8.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:63,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2_9.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:63,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:13) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_10.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2_11.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:18) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_12.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activity(id:50){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/2/success_2_13.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activities(tagId:7,type:\"learnflow\"){id name description isLocked leadImage progress}}" | graphql/2/success_2_14.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{activities(tagId:7){id name description isLocked leadImage progress}}" | graphql/2/success_2_15.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/2/success_2_16.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;teamId=7;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:8) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/2/success_2_17.json |

    Scenario: Graphql API test 3
        Given Practer app v2 api I login with username "mentor.one@practera.com" and password "El3phant" by "http://localhost:8080/api/auths.json"
        When I call the apis with:
            | api menthod | api endpoint | api request header | parameters format | parameters | result file |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:62,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:61,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:62,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:4) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_2.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{milestones{id name progress description isLocked activities{id name progress isLocked leadImage }}}" | graphql/3/success_3_3.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{activity(id:45){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/3/success_3_4.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{activity(id:46){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/3/success_3_5.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:56,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3_6.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:56,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:10) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_7.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:58,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3_8.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:58,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:11) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_9.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3_10.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:80,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:15) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_11.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:59,reviewer:false,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/6/success.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:59,reviewer:true,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:7) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/6/success_1.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{activity(id:50){id name description tasks{id name type isLocked isTeam deadline contextId status{status isLocked submitterName submitterImage}}}}" | graphql/3/success_3_12.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{activities(tagId:7,type:\"learnflow\"){id name description isLocked leadImage progress}}" | graphql/3/success_3_13.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{activities(tagId:7){id name description isLocked leadImage progress}}" | graphql/3/success_3_14.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:56,reviewer:true,activityId:45) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:10) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_15.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } } }" | graphql/3/success_3_16.json |
            | post | http://localhost:8000 | appkey=b11e7c189b;Content-Type=application/plain;timelineId=9 | raw | "{ assessment(id:64,reviewer:false,activityId:46) { name type description dueDate isTeam pulseCheck groups{ name description questions{ id name description type isRequired hasComment audience fileType choices{ id name explanation } teamMembers{ userId userName teamId } } } submissions(id:8) { id status completed modified locked submitter { name image } answers{ questionId answer } review { id status modified reviewer { name } answers { questionId answer comment } } } } }" | graphql/3/success_3_17.json |
