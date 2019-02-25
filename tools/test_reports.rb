require 'nokogiri'


def add_test_finished_time((reportFilePath)
    modifedTime = File.ctime(reportFilePath)
    fileContent = File.read(reportFilePath)
    doc =  Nokogiri::HTML(fileContent)
    durationContent = doc.at_css(".cucumber > script:nth-of-type(1)").content
    startp = durationContent.index('"') + 1
    endp = durationContent.rindex('"') - 1
    newContent = 'document.getElementById("duration").innerHTML = "%s, at <strong>%s<strong>";' % [durationContent[startp..endp], modifedTime]
    doc.at_css(".cucumber > script:nth-of-type(1)").content = newContent
    puts(doc.to_html)
end


add_test_finished_time((Dir.pwd + '/reports/report.html')