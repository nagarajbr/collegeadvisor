class CareerAdvisorWebServices
  include HTTParty
  base_uri 'http://www.labormarketanalytics.org'
  @api_token = 'n.hPfvDcMTgq.YYpbEwMI1uPs0cCn8332.mWnLDLeNd6Ps5C9ewTWWA8TIkQbKv.iBaSb0qcX7klKWcg-njkWNAteIqqClIaZ3dxr40VBXEt-51bAVj71geha8IALZLx'
  def initialize(u, p)
    @auth = {username: u, password: p}
  end

  def get_short_form_ip(options = {})
  response = self.class.get('/interestprofile/v1/',options)

  end

  def get_short_form_ip_results(arg_answers,options = {})
    options.merge!({basic_auth: @auth, verify: false})
    response = self.class.get("/ipresults/v1/#{arg_answers}",options)

  end

  def get_code_for_title(arg_title,options = {})
    options.merge!({basic_auth: @auth, verify: false })
    response = self.class.get(URI.encode("/occupationbytitle/v1/#{arg_title}"),options)
  end

    def get_occupations(options = {})
    options.merge!({basic_auth: @auth, verify: false })
    response = self.class.get(URI.encode("/occupationlist/v1/"),options)
  end

  def create_survey(arg_title,options = {})
     options.merge!({basic_auth: @auth, verify: false } )
     response = self.class.post(URI.encode("/CreateBulkySurveys/v1/n.hPfvDcMTgq.YYpbEwMI1uPs0cCn8332.mWnLDLeNd6Ps5C9ewTWWA8TIkQbKv.iBaSb0qcX7klKWcg-njkWNAteIqqClIaZ3dxr40VBXEt-51bAVj71geha8IALZLx/#{arg_title}/"),options)
  end

  def create_contacts(arg_contacts,options = {})
     options.merge!({basic_auth: @auth, verify: false ,  :headers => { 'Content-Type' => 'application/json' }, body: arg_contacts  })
     response = self.class.post(URI.encode("/CreateBulkyContacts/v1/n.hPfvDcMTgq.YYpbEwMI1uPs0cCn8332.mWnLDLeNd6Ps5C9ewTWWA8TIkQbKv.iBaSb0qcX7klKWcg-njkWNAteIqqClIaZ3dxr40VBXEt-51bAVj71geha8IALZLx/"),options)
  end

   def send_survey_to_contacts(arg_survey_type,options = {})
     options.merge!({basic_auth: @auth, verify: false , :headers => { 'Content-Type' => 'application/json' } })
     response = self.class.post(URI.encode("/SendBulkySurveys/v1/n.hPfvDcMTgq.YYpbEwMI1uPs0cCn8332.mWnLDLeNd6Ps5C9ewTWWA8TIkQbKv.iBaSb0qcX7klKWcg-njkWNAteIqqClIaZ3dxr40VBXEt-51bAVj71geha8IALZLx/#{arg_survey_type}/"),options)

  end

  def process_surveys(arg_survey_type,options = {})
     options.merge!({basic_auth: @auth, verify: false , :headers => { 'Content-Type' => 'application/json' }  })
     response = self.class.post(URI.encode("/ProcessBulkySurveys/v1/n.hPfvDcMTgq.YYpbEwMI1uPs0cCn8332.mWnLDLeNd6Ps5C9ewTWWA8TIkQbKv.iBaSb0qcX7klKWcg-njkWNAteIqqClIaZ3dxr40VBXEt-51bAVj71geha8IALZLx/#{arg_survey_type}/"),options)
  end


end
