Feature: Practera users timezone
    As a user
    the user profile display the default timezone as the user local timezone.
    so that User can changes the timezone to in the edit profile page.

    Scenario: Test change timezone in the user profile page
        Given I go to Practera Platform
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
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)" with scroll
        Then I should be able to see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should be able to see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Asia/Hong_Kong']" with xpath assert
        Then I click on "timezone dropdown menu" which is located at "//*[text()='Timezone']/..//*[@class='select2-choice']" with xpath
        Then I input "local" to "timezone select input box" which is located at "#s2id_autogen1_search"
        Then I click on "the select result" which is located at "#select2-results-1 > li span"
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)" with scroll
        Then I should be able to see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should be able to see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Australia/Sydney']" with xpath assert
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"

    Scenario: Test scheduled a communication email in response to the user timezone changes
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program1.admin@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "deliver tab button" which is located at "//*[text()='Deliver']/.." with xpath
        Then I wait 2 seconds
        Then I click on "communications button" which is located at "//*[text()='Deliver']/../..//*[normalize-space()='Communications']" with xpath
        Then I should be able to see "view comm button" which is located at "//*[normalize-space()='View Comm Activities']/button" with xpath
        Then I click on "add comm button" which is located at "//*[@class='visible-lg']/a[2]" with xpath
        Then I input "barry test comm - 20180601140801" to "title field" which is located at "#intitle input"
        Then I click on "Learners" which is located at "//label[@for='CommVisibilityParticipant']" with xpath
        Then I click on "Admins" which is located at "//label[@for='CommVisibilityAdmin']" with xpath
        Then I click on "Mentors/Employers" which is located at "//label[@for='CommVisibilityMentor']" with xpath
        Then I click on "Mail" which is located at "//label[@for='CommDeliveryEmail']" with xpath
        Then I input "barry test comm - 20180601140801 content" to "comm content" which is located at "#content-editor"
        Then I click on "the save button" which is located at "button[name='data[Comm][is_save]']"
        Then I input "barry test comm - 20180601140801" to "the search box" which is located at "input[aria-controls='tblOriginals']"
        Then I wait the search result with locator "table#tblOriginals tbody tr"
        Then I click on "send now" which is located at "//td[text()='barry test comm - 20180601140801']/..//a[@title='Send Now']" with xpath
        Then I select "test automation timeline - barry test project - 20180208150200" to "timeline selection" which is located at "select[name='data[Event][timeline_id]']"
        Then I click on "save button" which is located at "button[type='submit']"
        Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > a.dropdown-toggle"
        Then I click on "a button" which is located at "div.navbar-buttons > ul.nav > li:nth-of-type(3) > ul.user-menu > li:nth-of-type(4) > a"
        Given I go to Mailtrap
        When "Mailtrap" I login with username "phil@intersective.com" and password "El3phant"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with title "barry test comm - 20180601140801" and receiver "barry_test_program1.coor@practera.com"
        Then "Mailtrap" I search email with title "barry test comm - 20180601140801" and receiver "barry_test_program1.coordinator@practera.com"
        Then "Mailtrap" I log out