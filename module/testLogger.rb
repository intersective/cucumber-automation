require 'singleton'
require 'logger'


class TestLogger
	# mixin the singleton module
	include Singleton
	
	def initialize
		@logUUID = SecureRandom.uuid
		puts("TestLogger " + @logUUID)
		@infoLog = Logger.new(File.open(Dir.pwd + '/logs/info.log', File::WRONLY | File::APPEND), 10, 100 * 1024 * 1024)
		@errorLog = Logger.new(File.open(Dir.pwd + '/logs/error.log', File::WRONLY | File::APPEND), 10, 100 * 1024 * 1024)
		@caseLog = Logger.new(File.open(Dir.pwd + '/logs/testcases.log', File::WRONLY | File::APPEND), 10, 100 * 1024 * 1024)
		@traceLog = Logger.new(File.open(Dir.pwd + '/logs/trace.log', File::WRONLY | File::APPEND), 10, 100 * 1024 * 1024)
	end
	
	def info(message)
		@infoLog.info(@logUUID + ' ' + message)
	end
	
	def error(message)
		@errorLog.error(@logUUID + ' ' + message)
	end

	def debug(message)
		@traceLog.debug(@logUUID + ' ' + message)
	end

	def logCase(message)
		@caseLog.info(@logUUID + ' ' + message)
	end

	def close()
		@infoLog.close()
		@errorLog.close()
		@traceLog.close()
		@caseLog.close()
	end

end