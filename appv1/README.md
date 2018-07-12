list-of-features-appv1 - comprehensive test cases for a student in the appv1
list-of-features-appv1_onlyAssessment - register a student and complete a quiz assessment and a topic

run team assessment:
1. we run onlyAssessment for once to register another students and do an assessment then we apply
the student name on the below scripts
2. change the team name and student name in the data/team.json for list-of-features-appv1_teamwork
3. (Optioanl) change the team namd and student name in the data/team.json based on the team you want, then can run features/appv1/testAppV1TeamPage.feature separately by cucumber -q
4. (Optional) can run features/appv1/testAppv1FastFeedback.feature separately by cucumber -q
5. (Optional) can run features/appv1/appv1CheckModeraterdAssessment.feature separately by cucumber -q
6. (Optional) can run features/appv1/appv1NoAnswerForAssessment.feature separately by cucumber -q and change the username with a new user
7. (Optional) for team assessment progress, run two times of list-of-features-appv1_onlyAssessment to have two students who
have the same progress, change the student and team names in the data/team.json, run list-of-features-appv1_teamprogree.txt

The reason of separating the add team and team assessement is that, making the test cases being self-contained is better
to organise the test cases