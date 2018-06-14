configurations:
1. headless and server set to true - we use chrome headless option.
2. headless set to true and server set to false - we use google canary to drive the chrome headless
3. headless set to false - we use chrome UI mode
4. AWS_ACCESS_KEY_ID_EC2_OPR_USER who has the ec2 instance related permission
5. AWS_ACCESS_KEY_ID who has the s3 related permission
6. apiTest set to run on the api test mode, it simply disables the initialisation of the web driver
7. driverPath the chrome driver path on your machine
8. browserstack set to true, we invoke the remote driver on the BrowserStack