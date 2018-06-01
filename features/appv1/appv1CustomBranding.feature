Feature: Custom branding for app
    As an admin
    I want to customise the theme colour & card image for my program on App
    so that I can have my own app branding

    Scenario: Test Custom branding configuration page for admin
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "admin_selenium@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "a tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(5) a"
        Then I wait 2 seconds
        Then I click on "a tag" which is located at "#sidebar ul.nav li.hsub:nth-of-type(5) ul.submenu li:nth-of-type(1)"
        Then I should be able to see "program title" which is located at "//*[normalize-space()='Edit ProgramSave']" with xpath assert
        Then I should be able to see "program name" which is located at "//input[@name='data[Program][name]'][@value='App V1 Selenium Program']" with xpath assert
        Then I input "" to "theme color input field" which is located at "#theme-color"
        Then I input "#9e1668" to "theme color input field" which is located at "#theme-color" with scroll
        Then I click on "save button" which is located at "//button[normalize-space()='Save']" with xpath
        Then I should be able to see "successfully save message" which is located at ".toast-title" containing text "The program has been saved"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
		Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"
        
    Scenario: Test Custom branding for a student in the AppV1
        Given I go to App V1
        Then I wait 10 seconds
        Then "Appv1" I login with username "selenium.20180525145649@practera.com" and password "12341234"
        Then I wait until the loading finished
        Then I wait 5 seconds
        Then I should be able to see "tab" which is located at ".tabs" has color "9e1668"
        Then "Appv1" I log out