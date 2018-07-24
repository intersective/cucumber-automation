require 'singleton'
require 'selenium-webdriver'


class SharedWebDriver
	# mixin the singleton module
	include Singleton
	
	def initialize
		tconfigObj = readJsonfile(Dir.pwd + "/configuration/user.json")
		case tconfigObj["mode"]
			when "ui"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
				@driver = Selenium::WebDriver.for(:chrome)
			when "headless-chrome"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
				options = Selenium::WebDriver::Chrome::Options.new
				options.add_argument('--headless')
				@driver = Selenium::WebDriver.for(:chrome, options: options)
			when "headless-cancary"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
				caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: {
							binary: "/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary", 
							args: [ "--headless" ]})
				@driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
			when "browserstack"
				tconfigObjBrowserStack = readJsonfile(Dir.pwd + "/configuration/user_browserstack.json")
				caps = Selenium::WebDriver::Remote::Capabilities.new
				caps["os"] = tconfigObjBrowserStack["browserstackOS"]
				caps["os_version"] = tconfigObjBrowserStack["browserstackOSVersion"]
				caps["browser"] = tconfigObjBrowserStack["browserstackBrowser"]
				caps["browser_version"] = tconfigObjBrowserStack["browserstackBrowserVersion"]
				caps["resolution"] = tconfigObjBrowserStack["browserstackResolution"]
				caps["browserstack.local"] = tconfigObjBrowserStack["browserstackBrowserstackLocal"]
				caps["browserstack.selenium_version"] = tconfigObjBrowserStack["browserstackBrowserstackSeleniumVersion"]
				remoteHunUrl = "http://%s:%s@hub-cloud.browserstack.com/wd/hub" % [tconfigObjBrowserStack["browserstackUsername"], tconfigObjBrowserStack["browserstackAccessKey"]]
				@driver = Selenium::WebDriver.for(:remote, :url => remoteHunUrl, :desired_capabilities => caps)
			when "hub"
				tconfigObjHub = readJsonfile(Dir.pwd + "/configuration/user_hub.json")
				caps = Selenium::WebDriver::Remote::Capabilities.new
				caps["browserName"] = tconfigObjHub["nodeBrowserName"]
				caps["browserVersion"] = tconfigObjHub["nodeBrowserVersion"]
				caps["platform"] = tconfigObjHub["nodePlatform"]
				caps["seleniumVersion"] = tconfigObjHub["nodeSeleniumVersion"]
				@driver = Selenium::WebDriver.for(:remote, :url => "%s/wd/hub" % [tconfigObjHub["hubUrl"]], :desired_capabilities => caps)
			else
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
				@driver = Selenium::WebDriver.for(:chrome)
		end
		@driver.manage.window.move_to(0, 0)
		@driver.manage.window.resize_to(1440, 1000)
		@wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
		@listWait = Selenium::WebDriver::Wait.new(:timeout => 120) # seconds
		@shortWait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
		@normalWait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
	end
	
	def getDriver()
		return @driver
	end
	
	def getWaitor()
		return @wait
	end
	
	def getShortWaitor()
		return @shortWait
	end

	def getNormalWaitor()
		return @normalWait
	end

	def getListWaitor()
		return @listWait
	end

end
