#sites = ['discussthewaywelive.ca','bangthetable.com']
require 'uri'
sites = open("urls.list").read.split("\n").collect(&:strip)

sites.each { |url|
  begin
    domain = URI.parse(url).host
    data = `host #{domain}`
    line = data.split("\n").first
    arr = line.split("has address") 
  rescue 
     p url
     next
  end

  host = (arr.last.strip == '202.4.239.115' ? 'aloft' : (arr.last.strip == '203.110.139.199' ? 'prod' : 'some other'))

  p [arr.first.strip,host].join(',')
}
