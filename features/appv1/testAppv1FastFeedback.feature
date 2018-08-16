Feature: Appv1 slider type questions
    As a coordinator, I want to get frequent answers from my students to specific questions I am interested in
    so that I can intervene if the answers are suggesting an intervention is required.

    Scenario: Test Appv1 slider type questions for a student who is not in a team
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "selenium.20180530171600@practera.com" and password "12341234"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I should be able to see "Fast Feedback title" which is located at "//*[@class='title'][text()='Fast Feedback']" with xpath assert
        Then I should be able to see "the feedback description" which is located at "//*[text()='Before you continue, please spend 10 seconds to answer these questions.']" with xpath assert
        
        Then I can see a group of "fast feedback questions" with total "4" which is located at "[ng-repeat='question in modal.questions']"

        When I click on "submit button" which is located at "ion-modal-view button[type='submit']" with scroll
        Then I should be able to see "submission fail message" which is located at "//*[@class='popup']//*[normalize-space()='Please answer all the feedback questions.']"
        Then I click on "close button" which is located at ".popup-container button"

        Then I should be able to see "the first slider question title" which is located at "//*[@ng-repeat='question in modal.questions'][1]//*[text()='Q1. Have you personally engaged with your mentor within the last two weeks?']" with xpath scroll assert
        Then I should be able to see "the first slider question description" which is located at "//*[@ng-repeat='question in modal.questions'][1]//*[@ng-if='question.description'][text()='You should engage with your mentor at least once every fortnight.']" with xpath scroll assert
        Then I click on "Yes for the first question" which is located at "//*[@ng-repeat='question in modal.questions'][1]//span[normalize-space()='Yes']/../../.." with xpath scroll

        Then I should be able to see "the second slider question title" which is located at "//*[@ng-repeat='question in modal.questions'][2]//*[text()='Q2. Do you feel that your team is on track (team)?']" with xpath scroll assert
        Then I should be able to see "the second slider question description" which is located at "//*[@ng-repeat='question in modal.questions'][2]//*[@ng-if='question.description'][text()='Do you feel that your team is on track?']" with xpath scroll assert
        Then I click on "No for the second question" which is located at "//*[@ng-repeat='question in modal.questions'][2]//span[normalize-space()='No']/../../.." with xpath scroll

        Then I should be able to see "the third slider question title" which is located at "//*[@ng-repeat='question in modal.questions'][3]//*[text()='Q3. Do you feel that your team is on track(mentor)?']" with xpath scroll assert
        Then I should be able to see "the third slider question description" which is located at "//*[@ng-repeat='question in modal.questions'][3]//*[@ng-if='question.description'][text()='Do you feel that your team is on track?']" with xpath scroll assert
        Then I click on "No for the third question" which is located at "//*[@ng-repeat='question in modal.questions'][3]//span[normalize-space()='No']/../../.." with xpath scroll

        Then I should be able to see "the fourth slider question title" which is located at "//*[@ng-repeat='question in modal.questions'][4]//*[text()='Q4. In which stage do you think your team is at?']" with xpath scroll assert
        Then I should be able to see "the fourth slider question description" which is located at "//*[@ng-repeat='question in modal.questions'][4]//*[@ng-if='question.description'][text()='In which stage do you think your team is at? Refer to the project content if you are unsure which about the different stages.']" with xpath scroll assert
        Then I click on "Storming for the fourth question" which is located at "//*[@ng-repeat='question in modal.questions'][4]//span[normalize-space()='Storming']/../../.." with xpath scroll

        Then I click on "submit button" which is located at "ion-modal-view button[type='submit']" with scroll
        Then I should be able to see "submission completed messages" which is located at "//*[@class='popup']//*[text()='Submission Completed!']" with xpath assert
        Then I click on "close button" which is located at ".popup-container button"
        Then I wait until the loading finished
        Then "Appv1" I log out

        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "selenium.20180530171600@practera.com" and password "12341234"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I should not see "Fast Feedback title" which is located at "//*[@class='title'][text()='Fast Feedback']" with xpath assert
        Then "Appv1" I log out

    Scenario: Test Appv1 slider type questions for students who are in a team
        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "selenium.20180531102500@practera.com" and password "12341234"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I can see a group of "fast feedback questions" with total "4" which is located at "[ng-repeat='question in modal.questions']"
        Then I click on "Yes for the third question" which is located at "//*[@ng-repeat='question in modal.questions'][3]//span[normalize-space()='Yes']/../../.." with xpath scroll
        Then I click on "submit button" which is located at "ion-modal-view button[type='submit']" with scroll
        Then I should be able to see "submission fail message" which is located at "//*[@class='popup']//*[normalize-space()='Please answer all the feedback questions.']"
        Then I click on "close button" which is located at ".popup-container button"
        Then I click on "Yes for the first question" which is located at "//*[@ng-repeat='question in modal.questions'][1]//span[normalize-space()='Yes']/../../.." with xpath scroll
        Then I click on "Yes for the second question" which is located at "//*[@ng-repeat='question in modal.questions'][2]//span[normalize-space()='Yes']/../../.." with xpath scroll
        Then I click on "Storming for the fourth question" which is located at "//*[@ng-repeat='question in modal.questions'][4]//span[normalize-space()='Storming']/../../.." with xpath scroll
        Then I click on "submit button" which is located at "ion-modal-view button[type='submit']" with scroll
        Then I click on "close button" which is located at ".popup-container button"
        Then I wait until the loading finished
        Then "Appv1" I log out

        Given I go to App V1
        When "Appv1" I wait unitl the splash disappear
        Then "Appv1" I login with username "selenium.20180531102600@practera.com" and password "12341234"
        Then "Appv1" I should see the app home screen
        When I wait until the loading finished
        Then I can see a group of "fast feedback questions" with total "4" which is located at "[ng-repeat='question in modal.questions']"
        Then I click on "Yes for the first question" which is located at "//*[@ng-repeat='question in modal.questions'][1]//span[normalize-space()='Yes']/../../.." with xpath scroll
        Then I click on "No for the second question" which is located at "//*[@ng-repeat='question in modal.questions'][2]//span[normalize-space()='No']/../../.." with xpath scroll
        Then I click on "Yes for the third question" which is located at "//*[@ng-repeat='question in modal.questions'][3]//span[normalize-space()='Yes']/../../.." with xpath scroll
        Then I click on "Norming for the fourth question" which is located at "//*[@ng-repeat='question in modal.questions'][4]//span[normalize-space()='Norming']/../../.." with xpath scroll
        Then I click on "submit button" which is located at "ion-modal-view button[type='submit']" with scroll
        Then I click on "close button" which is located at ".popup-container button"
        Then I wait until the loading finished
        Then "Appv1" I log out