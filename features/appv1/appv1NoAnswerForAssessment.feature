Feature: No answer for an assessment
    As a student
    I do not want to answer any of them if there is an assessment with all optional questions
    so that I can choose what to do in the assessments

        Scenario: Test no answer for a quiz assessment
            Given I go to App V1
            Then I wait 10 seconds
            Then "Appv1" I login with username "selenium.20180525145649@practera.com" and password "12341234"
            Then I wait until the loading finished
            Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
            Then "Appv1" I go to the assessment locating at "9"
            Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"

            Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
            Then I should be able to see "a pop up" which is located at ".popup"
            Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
            Then I wait 3 seconds
            Then I click on "the ok button" which is located at ".popup> .popup-buttons > button"
            Then I wait 2 seconds
            Then I click on "the pop up button" which is located at ".modal button"
            Then I wait until the loading finished

            Then "Appv1" I can see the "Comprehensive Quiz Two" with status "Assessment done"
            Then "Appv1" I go to the assessment locating at "9"
            Then I should be able to see "assessment page" which is located at ".pane[nav-view='active']"
            Then I should be able to see "submitted messages" which is located at "//*[normalize-space()='Activity has been already submitted.']" with xpath scroll assert
            Then I should be able to see "the submit button" which is located at "//button[text()='Submit']" with xpath has class "ng-hide"
            Then "Appv1" I go back from assessment page
            Then "Appv1" I log out