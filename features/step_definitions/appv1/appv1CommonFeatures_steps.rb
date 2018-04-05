

Then(/^I login with "username" "([^"]*)" and "password" "([^"]*)"$/) do |userName, userPassword|
	$appv1PageActions.login($driver, $wait, userName, userPassword)
end

Then(/^I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end