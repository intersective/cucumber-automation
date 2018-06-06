![Practera](http://intersective-wordpress-media.s3.amazonaws.com/wp-content/uploads/2014/04/Practera_Logo.png)

## Overview
* This is the cucumber automation test (BDD) implemented by Ruby
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