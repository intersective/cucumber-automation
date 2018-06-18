require 'aws-sdk'
require 'aws-sdk-ec2'


class CommandExecutionError < StandardError

    attr_reader :stacktrace

    def initialize(msg)
        @stacktrace = Thread.current.backtrace.join("\n\t")
        super(msg)
    end
    
end

private def readJsonfile(filePath)
	fileContent = File.read(filePath)
	dataHash = JSON.parse(fileContent)
	return dataHash
end

private def getBucketObj(bucketName, regionName="ap-southeast-2")
    s3 = Aws::S3::Resource.new(region: regionName)
    bucket = s3.bucket(bucketName)
    if !bucket.exists?
        puts("bucket %s not exists" % [bucketName])
        return nil
    end
    return bucket
end

class MyAWSAction

    private def setup()
        userJson = readJsonfile(Dir.pwd + "/configuration/user.json")
        Aws.config.update({
            credentials: Aws::Credentials.new(userJson["AWS_ACCESS_KEY_ID"], userJson["AWS_SECRET_ACCESS_KEY"])
        })
    end

    def perform()
        setup()
    end

end

class MyAWSEC2Action

    private def setup()
        userJson = readJsonfile(Dir.pwd + "/configuration/user.json")
        Aws.config.update({
            credentials: Aws::Credentials.new(userJson["AWS_ACCESS_KEY_ID_EC2_OPR_USER"], userJson["AWS_SECRET_ACCESS_KEY_EC2_OPR_USER"])
        })
    end

    def perform()
        setup()
    end

end

class UploadFileAction < MyAWSAction

    def initialize(regionName, bucketName, filePathName)
        @regionName = regionName
        @bucketName = bucketName
        @filePathName = filePathName
    end

    def perform()
        super()
        bucket = getBucketObj(@bucketName, @regionName)
        if bucket == nil
            exit
        end

        fileName = Dir.pwd + '/' + @filePathName
        baseName = File.basename(fileName)
        obj = bucket.object(baseName)
        obj.upload_file(fileName)
    end

end

class DownLoadFile < MyAWSAction

    def initialize(regionName, bucketFileFullPath, localFilePath)
        @regionName = regionName
        @bucketFileFullPath = bucketFileFullPath
        @localFilePath = localFilePath
    end

    def perform()
        super()
        temp = @bucketFileFullPath.split(":")
        bucket = getBucketObj(temp[0], @regionName)
        if bucket == nil
            exit
        end

        obj = bucket.object(temp[1])
        obj.get(response_target: @localFilePath)
    end

end

class StartAWSInstanceByRegion < MyAWSEC2Action

    def initialize(instanceId, myRegion)
        @instanceId = instanceId
        @myRegion = myRegion
    end

    def perform()
        super()
        ec2 = Aws::EC2::Resource.new(region: @myRegion)
        i = ec2.instance(@instanceId)
        if i.exists?
            case i.state.code
            when 0  # pending
                puts("%s is pending, so it will be running in a bit" % [@instanceId])
            when 16  # started
                puts("%s is already started" % [@instanceId])
            when 48  # terminated
                puts("%s is terminated, so you cannot start it" % [@instanceId])
            else
                i.start
            end
        else
            puts("instance %s within the region %s does not exist" % [@instanceId, @myRegion])
        end
    end

end

class StopAWSInstanceByRegion < MyAWSEC2Action
    
    def initialize(instanceId, myRegion)
        @instanceId = instanceId
        @myRegion = myRegion
    end

    def perform()
        super()
        ec2 = Aws::EC2::Resource.new(region: @myRegion)
        i = ec2.instance(@instanceId)
        i.stop
    end

end

class GetAWSInstanceInfo < MyAWSEC2Action

    def initialize(instanceId, myRegion)
        @instanceId = instanceId
        @myRegion = myRegion
    end

    def perform()
        super()
        ec2 = Aws::EC2::Resource.new(region: @myRegion)
        i = ec2.instance(@instanceId)
        puts(i.public_ip_address)
    end
end

class DeleteSecRule < MyAWSAction

    def initialize(groupdId, regionName, fromIp)
        @groupdId = groupdId
        @regionName = regionName
        @fromIp = fromIp
    end

    def perform()
        super()
        ec2 = Aws::EC2::Client.new(region: @regionName)
        secGroup = ec2.describe_security_groups.security_groups.select do |sg|
            sg["group_id"] == @groupdId
        end
        if secGroup.length == 0
            raise CommandExecutionError.new("aws secruity group %s not found" % [@groupdId])
        end
        ippermissions = secGroup[0].ip_permissions
        if ippermissions.length == 0
            raise CommandExecutionError.new("aws secruity group %s has no ip permissions" % [@groupdId])
        end
        ipRange = nil
        ippermissions.each do |ipper|
            ipRange = ipper.ip_ranges.select do |ippr|
                ippr["cidr_ip"] == @fromIp
            end
        end
        if ipRange.length == 0
            raise CommandExecutionError.new("aws secruity group %s has no ip range matching to the argument %s" % [@groupdId, @fromIp])
        end
        ippermission = ippermissions[0]
        response = ec2.revoke_security_group_ingress({
            cidr_ip: ipRange[0]["cidr_ip"],
            group_id: @groupdId,
            ip_protocol: ippermission["ip_protocol"],
            from_port: ippermission["from_port"],
            to_port: ippermission["to_port"]
        })
        @ippermission = ippermission
        puts(response)
    end

    def getIppermission()
        return @ippermission
    end
    
end

class CreateSecRule < MyAWSAction

    def initialize(groupdId, regionName, toIp, ippermission)
        @groupdId = groupdId
        @regionName = regionName
        @toIp = toIp
        @ippermission = ippermission
    end

    def perform()
        super()
        ec2 = Aws::EC2::Client.new(region: @regionName)
        response = ec2.authorize_security_group_ingress({
            group_id: @groupdId,
            ip_permissions: [
                {
                    ip_protocol: @ippermission["ip_protocol"],
                    from_port: @ippermission["from_port"],
                    to_port: @ippermission["to_port"],
                    ip_ranges: [
                        {
                            cidr_ip: @toIp,
                        }
                    ]
                }
            ]
        })
        puts(response)
    end

end

def wait_for_instances(state, ids)
    begin
        ec2 = Aws::EC2::Client.new(region: myRegion)
        ec2.wait_until(state, instance_ids: ids)
        puts "Success: #{state}"
    rescue Aws::Waiters::Errors::WaiterFailed => error
        puts "Failed: #{error.message}"
    end
end

if ARGV.length == 0 || (ARGV.length == 1 && ARGV[0] == "-h")
    puts("Usage:")
    puts("usage: -h")
    puts("upload a file to a s3 bucket: bucket_name@region_name the_local_file_path -u")
    puts("download a file from a s3 bucket: bucketName:file_path_in_the_bucket@region_name the_local_file_path_to_save -d")
    puts("start a AWS instance within a region: instanceId myRegion -start")
    puts("stop a AWS instance within a region: instanceId myRegion -stop")
elsif ARGV.length == 3
    if ARGV[2] == "-u"
        t = ARGV[0].split("@")
        UploadFileAction.new(t[1], t[0], ARGV[1]).perform()
    elsif ARGV[2] == "-d"
        t = ARGV[0].split("@")
        DownLoadFile.new(t[1], t[0], ARGV[1]).perform()
    elsif ARGV[2] == "-start"
        StartAWSInstanceByRegion.new(ARGV[0], ARGV[1]).perform()
    elsif ARGV[2] == "-stop"
        StopAWSInstanceByRegion.new(ARGV[0], ARGV[1]).perform()
    elsif ARGV[2] == "-info"
        GetAWSInstanceInfo.new(ARGV[0], ARGV[1]).perform()
    else
        puts("do not support this argument %s" % [ARGV[3]])
    end
elsif ARGV.length == 5
    if ARGV[4] == "-update"
        begin
            cmd = DeleteSecRule.new(ARGV[0], ARGV[1], ARGV[2])
            cmd.perform()
            ippermission = cmd.getIppermission()
            if ippermission == nil
                return
            end
            sleep 1
            CreateSecRule.new(ARGV[0], ARGV[1], ARGV[3], ippermission).perform()
        rescue CommandExecutionError => e
            puts(e.message)
            puts(e.stacktrace)
        end
    else
        puts("do not support this argument %s" % [ARGV[4]])
    end
else
    puts("do not support this command")
end