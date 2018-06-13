require 'singleton'
require 'selenium-webdriver'


class SharedWebDriver
	# mixin the singleton module
	include Singleton
	
	def initialize
		tconfigObj = readJsonfile(Dir.pwd + "/configuration/user.json")
		if tconfigObj["browserstack"]
			caps = Selenium::WebDriver::Remote::Capabilities.new
			caps["os"] = "Windows"
			caps["os_version"] = "10"
			caps["browser"] = "Chrome"
			caps["browser_version"] = "66.0"
			caps["resolution"] = "1440x900"
			caps["browserstack.local"] = "false"
			caps["browserstack.selenium_version"] = "3.11.0"
			remoteHunUrl = "http://%s:%s@hub-cloud.browserstack.com/wd/hub" % [tconfigObj["browserstackUsername"], tconfigObj["browserstackAccessKey"]]
			@driver = Selenium::WebDriver.for(:remote, :url => remoteHunUrl, :desired_capabilities => caps)
		else	
			Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
			if tconfigObj["headless"]
				if tconfigObj["server"]
					options = Selenium::WebDriver::Chrome::Options.new
					options.add_argument('--headless')
					@driver = Selenium::WebDriver.for(:chrome, options: options)
				else
					caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: {
						binary: "/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary", 
						args: [ "--headless" ]})
					@driver = Selenium::WebDriver.for(:chrome, desired_capabilities: caps)
				end
			elsif
				@driver = Selenium::WebDriver.for(:chrome)
			end
			@driver.manage.window.move_to(0, 0)
			@driver.manage.window.resize_to(1440, 1000)
		end
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
