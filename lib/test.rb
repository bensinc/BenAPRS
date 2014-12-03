require 'net/http'
url = URI.parse('http://localhost:3000/api/write')
request = Net::HTTP::Post.new(url)
request.content_type = 'application/json'
request.body = '{"key":5,"packet":"N0MPM-4>APTT4,KC0NFA-2*,WIDE2-1,qAR,K0SXY:!4125.71N109255.50W#/Fill In Digi, Pella, IA/A=000830!w!!!"}'
response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
if response.code != 200
	puts "Error writing packet!"
end
