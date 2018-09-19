Feature: AppV1 mark moderated assessment feadback as read
	As a student
	I want to login to the app and check the feadback from the reviewers
	so that I can improve my work

    Scenario: Test AppV1 mark moderated assessment feadback as read
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with the student account and password "12341234"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I should be able to see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Comprehensive Moderated']" with xpath assert
        Then I click on "the feedback item" which is located at "//*[contains(@class, 'feedback-item')][1]" with xpath
        Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
        Then I wait until the loading finished
        Then I click on "mark review as read button" which is located at "//*[text()='Mark review as read']/../../label" with xpath scroll
        When "Appv1" I go back from assessment page
        Then I should not see "feeback notification item" which is located at "//*[contains(@class, 'feedback-item')]/*[text()='Comprehensive Moderated']" with xpath assert
        Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
        Then "Appv1" I can see the "Comprehensive Moderated" with status "Assessment done"
        Then I wait 3 seconds
        Then "Appv1" I log out