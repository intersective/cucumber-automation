@Feature
Feature: Program information
    As a program admin
    I want to seek some program analysis information
    so that I can see the progress of my program and how users perform

    Scenario: Test project dashboard with Admin
        Given I go to Practera Platform
        When "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see a list of active projects
        When I can click one project
        Then I can see the project dashboard
        Then I should see project milestones
        When I click on one of the milestones
        Then I can see the milestone's information on the project content page
    
    Scenario: Test project content with Admin
        Given I go to Practera Platform
        When "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see a list of active projects
        When I can click one project
        Then I can see the project dashboard
        When I click on Content tab
        Then I can see the milestones list

    Scenario: Test project annoucements with Admin
        Given I go to Practera Platform
        When "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see a list of active projects
        When I can click one project
        Then I can see the project dashboard
        When I click on Annoucements tab
        Then I can see the annoucements list

    Scenario: Test project calendar with Admin
        Given I go to Practera Platform
        When "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see a list of active projects
        When I can click one project
        Then I can see the project dashboard
        When I click on Calendar tab
        Then I can see the milestones list
