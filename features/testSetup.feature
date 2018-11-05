Feature: Valiadate cucumber setup
	As a cucumber user
	I want to know whether I setp the project environment properly
	so that I can start write test cases

    Scenario: Valiadate cucumber setup
		Given I go to "https://www.practera.com"
        When I wait 2 seconds
		Then I can see "introductions" which is located at "[data-id='2399140'] .elementor-text-editor h1" containing text "213123"
		Then I go to "https://intersective.com"
		When I wait 2 seconds
		Then I can see "introductions" which is located at "#home + div h2" containing text "213123"
		Then I wait 2 seconds

    Scenario: Valiadate cucumber setup
		Given I go to "https://www.practera.com"
        When I wait 2 seconds
		Then I can see "introductions" which is located at "[data-id='2399140'] .elementor-text-editor h1" containing text "213123"
		Then I go to "https://intersective.com"
		When I wait 2 seconds