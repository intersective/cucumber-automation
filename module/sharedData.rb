require 'singleton'


class SharedData
	# mixin the singleton module
	include Singleton
	
	def initialize
		@content = Hash.new
	end
	
	def load_data_from_key(key)
		return @content[key]
	end
	
	def put_data(key, value)
		@content[key] = value
	end

end