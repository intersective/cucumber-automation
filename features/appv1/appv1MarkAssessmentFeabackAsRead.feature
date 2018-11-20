Feature: AppV1 mark moderated assessment feedback as read
	As a student
	I want to login to the app and check the feedback from the reviewers
	so that I can improve my work

    Scenario: Test AppV1 mark moderated assessment feedback as read
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "studentPassword"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I should see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Comprehensive Moderated']" with xpath
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
        Then I should not see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Comprehensive Moderated']" with xpath
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I can see the "Comprehensive Moderated" with status "Assessment done"
        Then I wait 3 seconds
        Then "Appv1" I log out