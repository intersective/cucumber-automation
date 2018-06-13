list-of-features-appv1 - comprehensive test cases for a student in the appv1
list-of-features-appv1_onlyAssessment - register a student and complete a quiz assessment

run team assessment:
1. we may run onlyAssessment for once to register another students and do an assessment then we apply
the student name on the below scripts
2. change the student name in the testAddTeam, testAppV1TeamAssessment, testAppV1TeamEvaluation and testAppV1CheckTeamAssesment, which starts with selenium
3. (Optioanl) change the team member name in the testAppV1TeamPage based on the team you add, can run features/appv1/testAppV1TeamPage.feature separately by cucumber -q
4. (Optional) can run features/appv1/testAppv1FastFeedback.feature separately by cucumber -q
5. (Optional) can run features/appv1/appv1CheckModeraterdAssessment.feature separately by cucumber -q
6. (Optional) can run features/appv1/appv1NoAnswerForAssessment.feature separately by cucumber -q and change the username with a new user


The reason of separating the add team and team assessement is that, making the test cases being self-contained is better
to organise the test cases