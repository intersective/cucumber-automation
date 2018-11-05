![Practera](https://practera.com/wp-content/themes/practera/images/logo.png)

## Overview
* this is the cucumber automation test (BDD) implemented by Ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin17]
* ruby selenium web driver assists the tests to navigate and manipualte the web elements
* html format test repots are in the reports folder
* testsuites are in the top folders under the project directory, such as 'apitest'
* there are README explaining the procedure to run the tests for each suite
* module folder contain the self-defined modules which assist the implmenetation
* feature files are in the features folder
* step definitions are in the step_definition folder under the features folder
* tools/aws_s3.rb is a tool to manipulate the S3 bucket
* headlessScreenshot folder is to store the screenshots when there are errors occuring under the headless mode
* configuration contains the nessesscary setting to run the tests

## Setup
### Mac OS
* follow https://intersective.atlassian.net/wiki/spaces/QD/pages/322174977/Cucumber+Document to setp up the project structure

## Note
* https://intersective.atlassian.net/wiki/spaces/QD/pages/345407489/Cucumber+Format is a simple guide to write a step definition

## Some Handy Developer Links
* [Selenium](http://www.seleniumhq.org/docs/) - Web driver assists automates web-based testing
* [Cucumber](https://docs.cucumber.io/) - Behaviour Driver Development Testing Framework