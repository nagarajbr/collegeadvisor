class IndeedWebService
  include HTTParty
# http_proxy line should be uncommented if you use Proxy server
  #http_proxy '170.94.1.50', 8888
  base_uri 'http://api.indeed.com/ads'

  def initialize()
    @auth = {}
  end

  def job_by_location(arg_key_word,arg_city,arg_state,options = {})
    options.merge!({basic_auth: @auth, verify: false})
    arg_location = "#{arg_city},#{arg_state}"
    url = "/apisearch?publisher=7629882332306526&q=#{arg_key_word}&l=#{arg_location}&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2"
    response = self.class.get(url,options)
    return response.parsed_response
  end

   def job_by_location_count(arg_key_word,arg_city,arg_state,options = {})
    options.merge!({basic_auth: @auth, verify: false})
    arg_location = "#{arg_city},#{arg_state}"
    url = "/apisearch?publisher=7629882332306526&q=#{arg_key_word}&l=#{arg_location}&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2"
    response = self.class.get(url,options)
    return response.parsed_response["response"]["totalresults"]
  end

end
