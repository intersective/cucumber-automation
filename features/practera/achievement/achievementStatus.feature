Feature: Practera achievement status
    As a program admin
    I want to check the users' achievement status
    so that I can be aware of the users' program progress

    Scenario: Test checking of Practera achievement status for a team achievement
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "#(programAdminAccount)" and password "#(programAdminPassword)"
        Then I can see "a side bar" which is located at "#sidebar"
        Then "Practera" I go to the "Achievements" page
        Then I wait 2 seconds
        Then I can see "visible badge table" which is located at "#tblVisible"
        Then "Practera Achieve" I will go to No Badge section
        Then "Practera Achieve" I should see "team achievement"
        Then "Practera Achieve" I will go to recipients of "team achievement"
        Then "Practera Achieve" I can see student1 has the ahievement
        Then "Practera Achieve" I can see student2 has the ahievement
        Then I wait 2 seconds
        Then "Practera" I log out