require 'singleton'


class CommandObjects
    # mixin the singleton module
    include Singleton

    def initialize
        @commands = {
            "-u" => "UploadFileAction",
            "-d" => "DownLoadFile",
            "-start" => "StartAWSInstanceByRegion",
            "-stop" => "StopAWSInstanceByRegion",
            "-info" => "GetAWSInstanceInfo",
            "-deleteSecRule" => "DeleteSecRule",
            "-createSecRule" => "CreateSecRule",
            "-updateSecRule" => "UpdateSecRule"
        }
    end

    def is_valid_cmd(cmdName)
        return @commands.keys().include? cmdName
    end

    def get_cmd_class(cmdName)
        return @commands[cmdName]
    end
end