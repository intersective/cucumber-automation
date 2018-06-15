# configurations:
# 1. mode has following values and meanings:
## 1.1 ui or no value(run on normal browser mode)
## 1.2 apiTest(simply disables the initialisation of the web driver)
## 1.3 headless-chrome(se chrome headless option)
## 1.4 headless-cancary(use google canary to drive the chrome headless)
## 1.5 browserstack(invoke the remote driver on the BrowserStack)
#
# 2. AWS_ACCESS_KEY_ID_EC2_OPR_USER who has the ec2 instance related permission
# 3. AWS_ACCESS_KEY_ID who has the s3 related permission
# 4. driverPath defines the chrome driver path on your machine