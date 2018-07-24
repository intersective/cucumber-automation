# configurations:
# 1. mode has following values and meanings:
## 1.1 ui or no value(run on normal browser mode)
## 1.2 apiTest(simply disables the initialisation of the web driver)
## 1.3 headless-chrome(se chrome headless option)
## 1.4 headless-cancary(use google canary to drive the chrome headless)
## 1.5 browserstack(invoke the remote driver on the BrowserStack)
## 1.6 hub(invoke the remote driver on an ec2 windows intance)
## 1.7 mailtrapPracteraInboxId can get from the url after we enter the practera inbox
## 1.8 mailtrapApiToken can get from the mailtrap profile(settings) page
#
# 2. AWS_ACCESS_KEY_ID_EC2_OPR_USER who has the ec2 instance related permission
# 3. AWS_ACCESS_KEY_ID who has the s3 related permission
# 4. driverPath defines the chrome driver path on your machine
# 5. we may change the uploadFilePath if we run the test with the hub mode, and we want the driver to look for the files in the remote file system; no need now, we always look for the files in the local file system eventhough we are in the hub and browserstack mode
# 6. we may change the hubUrl when it is in hub mode
## 6.1 currently, we only support the chrome browser
## 6.2 nodeBrowserName, nodeBrowserVersion, nodePlatform and nodeSeleniumVersion are the parametes being sent to hun to decide which browser and driver to use