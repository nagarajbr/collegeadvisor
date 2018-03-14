
class UsJobsWebService
  include HTTParty
# http_proxy line should be uncommented if you use Proxy server
  #http_proxy '170.94.1.50', 8888
  base_uri 'https://api.usa.gov/jobs'

  def initialize()
    @auth = {}
  end

  def job_by_location(arg_key_word,arg_city,arg_state,options = {})
    options.merge!({basic_auth: @auth, verify: false})
    url = "/search.json?query=#{arg_key_word}+jobs+in+#{arg_state}"
    response = self.class.get(url,options)
    return response.parsed_response
  end

   def job_by_location_count(arg_key_word,arg_city,arg_state,options = {})
    options.merge!({basic_auth: @auth, verify: false})
    url = "/search.json?query=#{arg_key_word}+jobs+in+#{arg_state}"
    response = self.class.get(url,options)
    return response.parsed_response.length
  end
end
