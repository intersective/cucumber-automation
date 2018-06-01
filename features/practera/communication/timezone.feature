Feature: Practera users timezone
    As a user
    the user profile display the default timezone as the user local timezone.
    so that User can changes the timezone to in the edit profile page.

    Scenario: Test change timezone in the user profile page
        Given I go to "http://127.0.0.1:8080/"
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.coor@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(2) > a"
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should be able to see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Australia/Sydney']" with xpath assert
        Then I click on "timezone dropdown menu" which is located at "//*[text()='Timezone']/..//*[@class='select2-choice']" with xpath
        Then I input "Asia/Hong_Kong" to "timezone select input box" which is located at "#s2id_autogen1_search"
        Then I click on "the select result" which is located at "#select2-results-1 > li span"
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)"
        Then I should be able to see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should be able to see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Asia/Hong_Kong']" with xpath assert
        Then I click on "timezone dropdown menu" which is located at "//*[text()='Timezone']/..//*[@class='select2-choice']" with xpath
        Then I input "local" to "timezone select input box" which is located at "#s2id_autogen1_search"
        Then I click on "the select result" which is located at "#select2-results-1 > li span"
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)"
        Then I should be able to see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should be able to see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Australia/Sydney']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"