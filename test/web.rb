require 'net/http'

def get_web_document(url)
	uri = URI.parse(url)
	response = Net::HTTP.get_response(uri)

	case response
	when Net::HTTPSuccess
		return response.body
	when Net::HTTPRedirection
		return get_web_document(response['Location'])
	else
		return nil
	end
end

#puts get_web_document('http://www.rubyinside.com/test.txt')
#puts get_web_document('http://www.rubyinside.com/non-existent')
#puts get_web_document('http://www.rubyinside.com/redirect-test')

url = URI.parse("http://browserspy.dk/password-ok.php")
Net::HTTP.start(url.host, url.port) do |http| 
	req = Net::HTTP::Get.new(url.path)
	req.basic_auth("test", "test")
	puts http.request(req).body
end


