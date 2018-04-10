

Then(/^"Appv1" I login with "username" "([^"]*)" and "password" "([^"]*)"$/) do |userName, userPassword|
	$appv1PageActions.login($driver, $wait, userName, userPassword)
end

Then(/^"Appv1" I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end