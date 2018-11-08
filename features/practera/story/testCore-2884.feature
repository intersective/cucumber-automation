Feature: Practera is_required file applies to file type question
	As a program admin/coordinator
	I want to make sure that student answer the question before the submission is made. 
	so that I can ensure they give some key information during learding

    Scenario: Test Practera is_required file applies to file type question
        Given I go to Practera Platform
        When The "message" which is located at ".toast-message" should be disappear
        Then "Practera" I login with username "barry_test_program.student5@practera.com" and a predefined password "password1"
        Then I should be able to see "a side bar" which is located at "#sidebar"
        Then I click on "Assessments" which is located at "//*[normalize-space()='Assessments']/a" with xpath
        Then I wait 2 seconds
        Then I should be able to see a group of "todo assessments" which is located at "#todo tbody > tr"
        Then I should be able to see "an assessment" which is located at "//td/a[text()='Test file question required field']" with xpath assert
        Then I should be able to see "an assessment" which is located at "//td/a[text()='Test file question required field 2']" with xpath assert
        Then I click on "one assessment" which is located at "//td/a[text()='Test file question required field']/../../td[5]/a" with xpath
        Then I click on "begin/continue button" which is located at "button#take"
        Then I can see a group of "questions" with total "2" which is located at ".question"
        Then I click on "submit button" which is located at "button#submit"
        Then I can see an alert contain "One or more question is missing file upload!"
        Then I click on "Upload Files" which is located at "//a[text()='Upload Files']" with xpath
        Then I wait 2 seconds
        Then "Practera" I upload the file "medium-size-dogs-a-medium.jpg" to file picker
        Then I click on "submit button" which is located at "button#submit"
        Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
        Then I should be able to see a group of "todo assessments" which is located at "#todo tbody > tr"
        Then I click on "one assessment" which is located at "//td/a[text()='Test file question required field 2']/../../td[5]/a" with xpath
        Then I click on "begin/continue button" which is located at "button#take"
        Then I can see a group of "questions" with total "2" which is located at ".question"
        Then I click on "next button" which is located at "button#next" with scroll
        Then I should be able to see "step 2" which is located at "div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active"
        Then I click on "submit button" which is located at "button#submit"
        Then I can see an alert contain "One or more question is missing file upload!"
        Then I click on "Upload Files" which is located at "//a[text()='Upload Files']" with xpath
        Then I wait 2 seconds
        Then "Practera" I upload the file "Video Upload issue 2.mp4" to file picker
        Then I click on "submit button" which is located at "button#submit"
        Then I should be able to see "this field is required" which is located at "//div[@class='row question'][3]//div[text()='This field is required.']" with xpath
        Then I input "http://www.youtube.com/watch?v=9bZkp7q19f0" to "video url input box" which is located at "//div[@class='row question'][3]//input" with xpath scroll
        Then I move to "submit button" which is located at "button#submit"
        Then I should be able to see "a video" which is located at "#choice-video-embed > iframe"
        Then I click on "submit button" which is located at "button#submit"
        Then I should be able to see "message" which is located at ".toast-message"
		Then The "message" which is located at ".toast-message" should be disappear
        Then I should be able to see a group of "todo assessments" which is located at "#todo tbody > tr"
        Then "Practera" I log out