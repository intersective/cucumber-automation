@Feature
Feature: Custom branding for app
    As an admin
    I want to customise the theme colour & card image for my program on App
    so that I can have my own app branding

    Scenario: Test Custom branding configuration page for admin
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "programAdminAccount" and "programAdminPassword"
        Then I can see "a side bar" which is located at "#sidebar"
        Then "Practera" I go to the "Set-up" page
        Then I wait 2 seconds
        Then "Practera" I go to the "Branding" page
        Then I should see "program title" which is located at "//*[normalize-space()='Edit ProgramSave']" with xpath
        Then I should see "program name" which is located at "//input[@name='data[Program][name]'][@value='App V1 Selenium Program']" with xpath
        Then I input "#113d91" to "theme color input field" which is located at "#theme-color" with scroll
        When I click on "save button" which is located at "//button[normalize-space()='Save']" with xpath
        Then I should see "successfully save message" which is located at ".toast-title" containing text "The program has been saved"
        Then The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I log out
        
    Scenario: Test Custom branding for a student in the AppV1
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with "user" and "password1"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I wait 5 seconds
        Then I should see "tab" which is located at ".tabs" has color "113d91"
        Then "Appv1" I log out