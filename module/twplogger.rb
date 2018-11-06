require 'singleton'
require 'logging'


class Twplogger < TestLogger

    include Singleton

    def initialize
        @logUUID = SecureRandom.uuid
        puts("Twplogger " + @logUUID)
        buffersize = 2048
        opts = {:pattern => '%.1l, [%d#%p] %5l -- %c: %m\n', :date_pattern => "%Y-%m-%dT%H:%M:%S.%s"}
        pattern = Logging.layouts.pattern(opts)
        
        @infoAppender = Logging.appenders.file(Dir.pwd + '/logs/info.log')
        @infoAppender.layout = pattern
        @infoAppender.async = true
        @infoAppender.auto_flushing = buffersize

        @errorAppender = Logging.appenders.file(Dir.pwd + '/logs/error.log')
        @errorAppender.layout = pattern
        @errorAppender.async = true
        @errorAppender.auto_flushing = buffersize

        @tesecaseAppender = Logging.appenders.file(Dir.pwd + '/logs/testcases.log')
        @tesecaseAppender.layout = pattern
        @tesecaseAppender.async = true
        @tesecaseAppender.auto_flushing = buffersize

        @traceAppender = Logging.appenders.file(Dir.pwd + '/logs/trace.log')
        @traceAppender.layout = pattern
        @traceAppender.async = true
        @traceAppender.auto_flushing = buffersize

        @infoLog = Logging.logger['infoLog']
        @infoLog.add_appenders(@infoAppender)
        @infoLog.level = :debug

        @errorLog = Logging.logger['errorLog']
        @errorLog.add_appenders(@errorAppender)
        @errorLog.level = :debug

        @caseLog = Logging.logger['caseLog']
        @caseLog.add_appenders(@tesecaseAppender)
        @caseLog.level = :debug

        @traceLog = Logging.logger['traceLog']
        @traceLog.add_appenders(@traceAppender)
        @traceLog.level = :debug
    end

    def close()
        @infoAppender.close()
        @errorAppender.close()
        @tesecaseAppender.close()
        @traceAppender.close()
    end

end