Feature: AppV1 team page
	As a student
	I want to login to the app and see who is working with me in the same team
	so that I can collaborate with them

    Scenario: Test AppV1 team page
        Given I go to App V1
        Then I wait 10 seconds
        Then "Appv1" I login with username "selenium.20180619113736@practera.com" and password "12341234"
        Then I wait until the loading finished
        Then "Appv1" I go to the "3" tab page
        Then I wait until the loading finished
        Then I should be able to see "team title" which is located at "//*[text()='Team 30']" with xpath assert
        Then I can see "first member name" which is located at "[ng-repeat='member in members']:nth-of-type(1) > [ng-bind='member.name']" containing text "selenium.20180619113736"
        Then I can see "first member name" which is located at "[ng-repeat='member in members']:nth-of-type(1) > [ng-bind='member.email']" containing text "selenium.20180619113736@practera.com"
        Then I can see "first member name" which is located at "[ng-repeat='member in members']:nth-of-type(2) > [ng-bind='member.name']" containing text "selenium.20180619103038"
        Then I can see "first member name" which is located at "[ng-repeat='member in members']:nth-of-type(2) > [ng-bind='member.email']" containing text "selenium.20180619103038@practera.com"
        Then "Appv1" I log out