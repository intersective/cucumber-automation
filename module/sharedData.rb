require 'singleton'


class SharedData
	# mixin the singleton module
	include Singleton
	
	def initialize
		@content = Hash.new
	end
	
	def loadDataFromKey(key)
		return @content[key]
	end
	
	def putData(key, value)
		@content[key] = value
	end

end