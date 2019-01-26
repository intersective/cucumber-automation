@Feature
Feature: Project assessments
    As a program admin
    I want to seek some project assessments information
    so that I can see the overview of my program's assessments and how partipants perform

    Scenario: Test project dashboard with Admin
        Given I go to Practera Platform
        When "Practera" I login with username "#(user)" and password "#(password1)"
        Then I can see a list of active projects
        When I can click one project
        Then I can see the project dashboard
        When I click the Assessments Tab
        Then I can see a list of assessments
        When I cick on unassigened button of team decision assessment
        Then I can see a list of submissions
        When I click on Add Reviewers button
        Then I can input a reviewer name
        Then I can select the reviewer