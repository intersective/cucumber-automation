require 'aws-sdk'
require 'aws-sdk-ec2'


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
elsif ARGV.length != 3
    puts("do not support this command")
else
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
end