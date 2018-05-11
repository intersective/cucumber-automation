require 'aws-sdk'


private def readJsonfile(filePath)
	fileContent = File.read(filePath)
	dataHash = JSON.parse(fileContent)
	return dataHash
end

private def setup()
    userJson = readJsonfile(Dir.pwd + "/configuration/user.json")
    Aws.config.update({
    credentials: Aws::Credentials.new(userJson["AWS_ACCESS_KEY_ID"], userJson["AWS_SECRET_ACCESS_KEY"])
    })
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

private def uploadFile()
    setup()

    bucket = getBucketObj(ARGV[0])
    if bucket == nil
        exit
    end

    fileName = Dir.pwd + '/' + ARGV[1]
    baseName = File.basename(fileName)
    obj = bucket.object(baseName)
    obj.upload_file(fileName)
end

private def downFile()
    setup()

    temp = ARGV[0].split(":")
    bucket = getBucketObj(temp[0])
    if bucket == nil
        exit
    end

    obj = bucket.object(temp[1])
    obj.get(response_target: ARGV[1])
end

if ARGV.length == 1 && ARGV[0] == "-h"
    puts("Usage:")
    puts("upload a file to a s3 bucket: bucket_name the_local_file_path -u")
    puts("download a file from a s3 bucket: bucketName:file_path_in_the_bucket the_local_file_path_to_save -d")
elsif ARGV.length != 3
    puts("do not support this command")
else
    if ARGV[2] == "-u"
        uploadFile()
    elsif ARGV[2] == "-d"
        downFile()
    else
        puts("do not support this argument %s" % [ARGV[3]])
    end
end