require 'singleton'
require 'selenium-webdriver'


class SharedWebDriver
	# mixin the singleton module
	include Singleton
	
	def initialize
		tconfigObj = readJsonfile(Dir.pwd + "/configuration/user.json")
		Selenium::WebDriver::Chrome.driver_path=tconfigObj["driverPath"]
		@driver = Selenium::WebDriver.for :chrome
		@driver.manage.window.move_to(0, 0)
		@driver.manage.window.resize_to(1440, 1000)
		@wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
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

end
