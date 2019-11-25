require 'singleton'
require 'selenium-webdriver'


class SharedWebDriver
	# mixin the singleton module
	include Singleton
	
	def initialize
		tconfigObj = load_config(Dir.pwd + "/configuration/user.json")
		case tconfigObj["MODE"]
			when "ui"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["DRIVER_PATH"]
				options = Selenium::WebDriver::Chrome::Options.new
				options = enable_mobile_device(options, tconfigObj)
				options.add_argument('start-maximized')
				@driver = Selenium::WebDriver.for(:chrome, options: options)
			when "headless-chrome"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["DRIVER_PATH"]
				options = Selenium::WebDriver::Chrome::Options.new
				options.add_argument('--headless')
				options = enable_mobile_device(options, tconfigObj)
				options.add_argument('start-maximized')
				@driver = Selenium::WebDriver.for(:chrome, options: options)
			when "headless-cancary"
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["DRIVER_PATH"]
				caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: {
							binary: "/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary", 
							args: [ "--headless" ]})
				@driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
			when "browserstack"
				tconfigObjBrowserStack = load_config(Dir.pwd + "/configuration/user_browserstack.json")
				caps = Selenium::WebDriver::Remote::Capabilities.new
				caps["os"] = tconfigObjBrowserStack["BROWSERSTACK_OS"]
				caps["os_version"] = tconfigObjBrowserStack["BROWSERSTACK_OSVERSION"]
				caps["browser"] = tconfigObjBrowserStack["BROWSERSTACK_BROWSER"]
				caps["browser_version"] = tconfigObjBrowserStack["BROWSERSTACK_BROWSERVERSION"]
				caps["resolution"] = tconfigObjBrowserStack["BROWSERSTACK_RESOLUTION"]
				caps["browserstack.local"] = tconfigObjBrowserStack["BROWSERSTACK_LOCAL"]
				caps["browserstack.selenium_version"] = tconfigObjBrowserStack["BROWSERSTACK_SELENIUMVERSION"]
				remoteHunUrl = "http://%s:%s@hub-cloud.browserstack.com/wd/hub" % [tconfigObjBrowserStack["BROWSERSTACK_USERNAME"], tconfigObjBrowserStack["BROWSERSTACK_ACCESSKEY"]]
				@driver = Selenium::WebDriver.for(:remote, :url => remoteHunUrl, :desired_capabilities => caps)
			when "hub"
				tconfigObjHub = load_config(Dir.pwd + "/configuration/user_hub.json")
				caps = Selenium::WebDriver::Remote::Capabilities.new
				caps["browserName"] = tconfigObjHub["NODE_BROWSER_NAME"]
				caps["browserVersion"] = tconfigObjHub["NODE_BROWSER_VERSION"]
				caps["platform"] = tconfigObjHub["NODE_PLATFORM"]
				caps["seleniumVersion"] = tconfigObjHub["NODE_SELENIUM_VERSION"]
				@driver = Selenium::WebDriver.for(:remote, :url => "%s/wd/hub" % [tconfigObjHub["HUB_URL"]], :desired_capabilities => caps)
			else
				Selenium::WebDriver::Chrome.driver_path=tconfigObj["DRIVER_PATH"]
				options = Selenium::WebDriver::Chrome::Options.new
				options = enable_mobile_device(options, tconfigObj)
				options.add_argument('start-maximized')
				@driver = Selenium::WebDriver.for(:chrome, options: options)
		end
		@driver.manage.window.move_to(0, 0)
		@wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
		@listWait = Selenium::WebDriver::Wait.new(:timeout => 120) # seconds
		@shortWait = Selenium::WebDriver::Wait.new(:timeout => 3) # seconds
		@normalWait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
	end
	
	def get_driver()
		return @driver
	end
	
	def get_waitor()
		return @wait
	end
	
	def get_short_waitor()
		return @shortWait
	end

	def get_normal_waitor()
		return @normalWait
	end

	def get_list_waitor()
		return @listWait
	end

	private def enable_mobile_device(options, tconfigObj)
		if tconfigObj["USER_AGENT"] != "" && tconfigObj["DEVICE_NAME"] != ""
			options.add_argument('user-agent=' + tconfigObj["USER_AGENT"])
			options.add_emulation(:device_name => tconfigObj["DEVICE_NAME"])
		end
		return options
	end

end
