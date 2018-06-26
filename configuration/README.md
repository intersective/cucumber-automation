# configurations:
# 1. mode has following values and meanings:
## 1.1 ui or no value(run on normal browser mode)
## 1.2 apiTest(simply disables the initialisation of the web driver)
## 1.3 headless-chrome(se chrome headless option)
## 1.4 headless-cancary(use google canary to drive the chrome headless)
## 1.5 browserstack(invoke the remote driver on the BrowserStack)
## 1.6 hub(invoke the remote driver on an ec2 windows intance)
#
# 2. AWS_ACCESS_KEY_ID_EC2_OPR_USER who has the ec2 instance related permission
# 3. AWS_ACCESS_KEY_ID who has the s3 related permission
# 4. driverPath defines the chrome driver path on your machine
# 5. we may change the uploadFilePath if we run the test with the browser stack or hub mode, since the driver would have to look for the files in the local file system
# 6. we may change the hubUrl when it is in hub mode
## 6.1 currently, we only support the chrome browser