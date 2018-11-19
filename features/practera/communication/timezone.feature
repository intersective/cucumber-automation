Feature: Practera users timezone
    As a user
    the user profile display the default timezone as the user local timezone.
    so that User can changes the timezone to in the edit profile page.

    Scenario: Test change timezone in the user profile page
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "testprogram1AdminAccount" and "testprogram1AdminAccountPassword"
        Then I can see "a side bar" which is located at "#sidebar"
        Then "Practera" I go to profile
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Australia/Sydney']" with xpath
        Then I click on "timezone dropdown menu" which is located at "//*[text()='Timezone']/..//*[@class='select2-choice']" with xpath
        Then I input "Asia/Hong_Kong" to "timezone select input box" which is located at "#s2id_autogen1_search"
        Then I click on "the select result" which is located at "#select2-results-1 > li span"
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)" with scroll
        Then I should see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Asia/Hong_Kong']" with xpath
        Then I click on "timezone dropdown menu" which is located at "//*[text()='Timezone']/..//*[@class='select2-choice']" with xpath
        Then I input "local" to "timezone select input box" which is located at "#s2id_autogen1_search"
        Then I click on "the select result" which is located at "#select2-results-1 > li span"
        Then I click on "the save button" which is located at "#UserProfileEditForm > .form-actions button:nth-of-type(1)" with scroll
        Then I should see "successfully save message" which is located at ".toast-title" containing text "Your profile has been updated"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I click on "edit profile button" which is located at ".page-header a:nth-of-type(1)"
        Then I should see "user local timezone" which is located at "//*[@id='select2-chosen-1'][text()='Australia/Sydney']" with xpath
        Then "Practera" I log out

    Scenario: Test scheduled a communication email in response to the user timezone changes
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "testprogram1AdminAccount" and "testprogram1AdminAccountPassword"
        Then I can see "a side bar" which is located at "#sidebar"
        Then I click on "communications button" which is located at "//*[text()='Communications']/.." with xpath
        Then I can see "view comm button" which is located at "//*[normalize-space()='View Comm Activities']/button" with xpath
        Then I click on "add comm button" which is located at "//*[normalize-space()='Add Comm']" with xpath
        Then I input "barry test comm - 20181107041900" to "title field" which is located at "#intitle input"
        Then I click on "Learners" which is located at "//label[@for='CommVisibilityParticipant']" with xpath
        Then I click on "Admins" which is located at "//label[@for='CommVisibilityAdmin']" with xpath
        Then I click on "Mentors/Employers" which is located at "//label[@for='CommVisibilityMentor']" with xpath
        Then I click on "Mail" which is located at "//label[@for='CommDeliveryEmail']" with xpath
        Then I input "barry test comm - 20181107041900 content" to "comm content" which is located at "#content-editor"
        Then I click on "the save button" which is located at "button[name='data[Comm][is_save]']"
        Then I input "barry test comm - 20181107041900" to "the search box" which is located at "input[aria-controls='tblOriginals']"
        Then I wait the search result with locator "table#tblOriginals tbody tr"
        Then I click on "send now" which is located at "//td[text()='barry test comm - 20181107041900']/..//a[@title='Send Now']" with xpath
        Then I select "test automation timeline - barry test project - 20180208150200" to "timeline selection" which is located at "select[name='data[Event][timeline_id]']"
        Then I click on "save button" which is located at "button[type='submit']"
        Then I can see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I log out
        Given I go to Mailtrap
        When "Mailtrap" I login with "mailtrapUser" and "mailtrapUserPassword"
        Then "Mailtrap" I go to practera inbox
        Then "Mailtrap" I search email with title "barry test comm - 20181107041900" and receiver "barry_test_program1.admin@practera.com"
        Then "Mailtrap" I search email with title "barry test comm - 20181107041900" and receiver "test_program_student_1@practera.com"
        Then "Mailtrap" I log out