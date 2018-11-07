Feature: Practera is_required file applies to different type of question
    As a program admin/mentor
    I want to make sure that student answer the compulsory questions before the submission is made.
    so that I can ensure they give some key information during learding

    Scenario: Test Practera is_required file applies to different type of question
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program.student6@practera.com" and password "12341234"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "assessments tag" which is located at "//*[text()='Assessments']/.." with xpath
        Then I wait 2 seconds
        Then I should be able to see a group of "todo assessments" which is located at "#todo tbody > tr"
        Then I should be able to see "an assessment" which is located at "//td/a[text()='Test question required field']" with xpath assert
        Then I click on "one assessment" which is located at "//td/a[text()='Test question required field']/../../td[5]/a" with xpath
        Then I click on "begin/continue button" which is located at "button#take"
        Then I click on "next button" which is located at "button#next" with scroll
        Then I should be able to see "this field is required" which is located at "//div[@class='row question'][1]//div[text()='This field is required.']" with xpath assert
        Then I input "I am feeling happy now - Text question 1" to "Free text answer" which is located at "//span[normalize-space()='Text question 1']/../..//span[normalize-space()='Free text answer']/../textarea" with xpath scroll
        Then I click on "next button" which is located at "button#next" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
        Then I click on "next button" which is located at "button#next" with scroll
        Then I should be able to see "this field is required" which is located at "//div[@class='row question'][1]//div[text()='This field is required.']" with xpath assert
        Then I click on "Choice 3" which is located at "//span[normalize-space()='Multiple Choice Question 1']/../..//span[normalize-space()='Choice 3']" with xpath
        Then I click on "next button" which is located at "button#next" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 3" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active"
        Then I wait 2 seconds
        Then I click on "next button" which is located at "button#next" with scroll
        Then I can see an alert contain "One or more question is missing file upload!"
        Then I click on "Upload Files" which is located at "//*[text()='File Question - any']/../..//a[text()='Upload Files']" with xpath scroll
        Then I wait 2 seconds
        Then "Practera" I upload the file "2017-Scrum-Guide-US.pdf" to file picker
        Then I click on "next button" which is located at "button#next" with scroll
        Then I can see an alert contain "One or more question is missing file upload!"
        Then I click on "Upload Files" which is located at "//*[text()='File question - image']/../..//a[text()='Upload Files']" with xpath scroll
        Then I wait 2 seconds
        Then "Practera" I upload the file "medium-size-dogs-a-medium.jpg" to file picker
        Then I click on "next button" which is located at "button#next" with scroll
        Then I can see an alert contain "One or more question is missing file upload!"
        Then I click on "Upload Files" which is located at "//*[text()='File Question - video']/../..//a[text()='Upload Files']" with xpath scroll
        Then I wait 2 seconds
        Then "Practera" I upload the file "Video Upload issue 2.mp4" to file picker
        Then I wait 2 seconds
        Then I click on "next button" which is located at "button#next" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 4" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active"
        Then I click on "submit button" which is located at "button#submit" with scroll
        Then I should be able to see "this field is required" which is located at "//div[@class='row question'][1]//div[text()='This field is required.']" with xpath assert
        Then I input "http://www.youtube.com/watch?v=9bZkp7q19f0" to "video url input box" which is located at "//div[@class='row question'][1]//input" with xpath scroll
        Then I move to "Video Question 1" which is located at "//*[text()='Video Question 1']" with xpath
        Then I should be able to see "a video" which is located at "#choice-video-embed > iframe"
        Then I click on "submit button" which is located at "button#submit" with scroll
        Then I should be able to see "message" which is located at ".toast-message"
        Then The "message" which is located at ".toast-message" should be disappear
        Then I should be able to see a group of "todo assessments" which is located at "#todo tbody > tr"
        Then "Practera" I log out

    Scenario: Test Practera is_required file applies to different type of question assign a mentor
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "testprogram1AdminAccount" and "testprogram1AdminAccountPassword"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "submissions tab" which is located at "//*[text()='Submissions']/.." with xpath
        Then I should be able to see a group of "assessments" which is located at ".content-container > div#assessments > .tab-content > #moderated div> table > tbody > tr" with assert
        Then I click on "Test question required field" which is located at "//*[text()='Test question required field']/../../td[3]/a" with xpath
        Then I click on "review tab" which is located at "#assessTab > li:nth-of-type(2)"
		Then I wait 2 seconds
		Then I should be able to see a group of "unassigned submissions" which is located at "#tblUnassigned > tbody > tr"
		Then "Practera" I should see a student "barry_test_program.student6" submission
		Then "Practera" I can assign a mentor "testprogram1Mentor" to a student "barry_test_program.student6" submission
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I scroll to the top
		Then I wait 2 seconds
		Then I click on "a tag" which is located at ".page-header span > a"
		Then I wait 2 seconds
        Then "Practera" I log out

    Scenario: Test Practera is_required file applies to different type of question mentor review
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with "testprogram1MentorAccount" and "testprogram1MentorAccountPassword"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "reviews & feedback" which is located at "//*[text()='Reviews & Feedback']/.." with xpath
        Then I wait 2 seconds
        Then I click on "my reviews" which is located at "//*[text()='Reviews & Feedback']/../..//*[normalize-space()='My Reviews']" with xpath
        Then I should be able to see a group of "to review submission" which is located at "#toreview tbody tr" with assert
        Then "Practera" I can go to the review page with a student "barry_test_program.student6" submission and the assessment "Test question required field"
        Then I click on "the start button" which is located at "//*[@id='start-page']/../*[contains(@class, 'form-actions')]/button" with xpath
        Then I wait 2 seconds
        Then I should be able to see "wizard steps" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active" with assert
        Then I input "your works are excellent, thank you for submissions - text question 1" to "Free text review" which is located at "//span[normalize-space()='Text question 1']/../..//span[normalize-space()='Free text review']/../textarea" with xpath scroll
        Then I input "your works are excellent, thank you for submissions - text question 2" to "Free text review" which is located at "//span[normalize-space()='Text question 2']/../..//span[normalize-space()='Free text review']/../textarea" with xpath scroll
        Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
        Then I click on "Choice 5" which is located at "//span[normalize-space()='Multiple Choice Question 1']/../..//span[normalize-space()='Choice 5']" with xpath scroll
        Then I input "your works are excellent, thank you for submissions - Multiple Choice Question 1" to "Reviewer comments" which is located at "//span[normalize-space()='Multiple Choice Question 1']/../..//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
        Then I click on "Choice 4" which is located at "//span[normalize-space()='New Question']/../..//span[normalize-space()='Choice 4']" with xpath scroll
        Then I input "your works are excellent, thank you for submissions - New Question" to "Reviewer comments" which is located at "//span[normalize-space()='New Question']/../..//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
        Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 3" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active"
        Then I wait 2 seconds
        Then I click on "next button" which is located at "div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary" with scroll
        Then I wait 2 seconds
        Then I should be able to see "step 4" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active"
        Then I should be able to see "a video url" which is located at "//*[normalize-space()='Video Question 1']/../..//input[@value='http://www.youtube.com/watch?v=9bZkp7q19f0']" with xpath assert
        Then I input "your works are excellent, thank you for submissions - Video Question 1" to "Reviewer comments" which is located at "//span[normalize-space()='Video Question 1']/../..//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
        Then I input "your works are excellent, thank you for submissions - Video Question 2" to "Reviewer comments" which is located at "//span[normalize-space()='Video Question 2']/../..//span[normalize-space()='Reviewer Comments']/../textarea" with xpath scroll
        Then I wait 2 seconds
		Then I click on "submit button" which is located at "div#assessment-buttons button#submit" with scroll
		Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
		Then I wait 2 seconds
        Then "Practera" I log out