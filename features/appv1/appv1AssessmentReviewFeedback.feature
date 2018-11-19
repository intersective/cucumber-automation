Feature: AppV1 assessment review and feedback
	As a student
	I want to login to the app and check the feedback from the reviewers
	so that I can improve my work

    Scenario: Test AppV1 assessment review and feedback
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I should see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Moderated 4 - participant no file and video url']" with xpath
        Then I click on "the feedback item" which is located at "//*[contains(@class, 'feedback-item')][1]" with xpath
        Then I can see "assessment page" which is located at ".pane[nav-view='active']"
        Then I wait until the loading finished
        Then I click on "mark review as read button" which is located at "//*[text()='Mark review as read']/../../label" with xpath scroll
        Then I wait until the loading finished
        Then I can see "rating pop up" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl']"
        Then I move the slider "feedback rating" to the "right" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl'] input[type='range']" by "3" times
        Then I wait 2 seconds
        Then I click on "quick response" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl'] .quick-response > a[ng-click=\"addOrRemoveQuickMessage('You are awesome!')\"]"
        Then I input "very informative" to "rating comment" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl'] input[ng-model='reviewRating.comment']" with scroll
        Then I wait 2 seconds
        Then I click on "submit button" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl'] button" with scroll
        Then The "feedback rating" which is located at "ion-modal-view.active > [ng-controller='reviewRatingCtrl']" should be disappear
        When "Appv1" I go back from assessment page
        Then I should not see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Moderated 4 - participant no file and video url']" with xpath
        Then "Appv1" I go to the "Activity Four" activity page which has "2" items
        Then "Appv1" I can see the "Moderated 4 - participant no file and video url" with status "Assessment published"
        Then I wait 2 seconds
        Then "Appv1" I go to the assessment locating at "2"
        Then I can see "text question submitter answer" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][1]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.submitter']//*[@class='item']" with xpath containing text "This is the text from Selenium text automation"
        Then I can see "text question reviewer commnet" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][1]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.reviewer']//*[contains(concat(' ', @class, ' '), 'review')]/p" with xpath containing text "This is the text from Selenium text automation"
        Then I can see "submitter answer" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][2]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.submitter']//*[@class='list']" with xpath containing text "Normal"
        Then I can see "reviewer choice" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][2]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.reviewer']//*[contains(concat(' ', @class, ' '), 'review')][1]/p" with xpath containing text "Good"
        Then I can see "reviewer comment" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][2]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.reviewer']//*[contains(concat(' ', @class, ' '), 'review')][2]/span" with xpath containing text "This is the text from Selenium text automation"
        Then I can see "reviewer choices" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][3]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.submitter']//*[@class='list']" with xpath containing text "Choice 0.8, Choice 0.6"
        Then I can see "reviewer checkbox commnet" which is located at "//*[@ng-repeat='group in ::assessment.questionGroups'][3]/*[@ng-repeat='question in group.questions'][1]/*[@ng-repeat='answer in question.answers.reviewer']//*[contains(concat(' ', @class, ' '), 'review')][2]/span" with xpath containing text "This is the text from Selenium text automation"
        When "Appv1" I go back from assessment page
        Then "Appv1" I log out