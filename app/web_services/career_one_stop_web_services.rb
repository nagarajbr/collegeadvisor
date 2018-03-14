class CareerOneStopWebServices
  include HTTParty
  #base_uri 'https://api.careeronestop.org'
  #default_params :apiKey => 'xRKGdcC5zoU47X4Z7Kzv8y+eOczXpgc5bnzAb7wtPP5Pq9HAw1rKXvT2vsIzWY0AZ1PuegcEuqdaJZDexQMi+A=='
  def initialize(u, p)
    @auth = {username: u, password: p}

  end

  def get_skill_and_knowledge_gaps_between_two_occupations(options = {})
    options.merge!({basic_auth: @auth, verify: false})
    response = self.class.get('http://webservices.myskillsmyfuture.org/SkillsGap.svc/skillsgap/userid/uHJilyjTE3YGOan/currentoccupation/47215202/targetoccupation/47211100/location/0/radius/20',options)
    Hash.from_xml(response.parsed_response.gsub("\n", ""))
  end

  def get_training_by_occupation(arg_occupation_code,arg_location,options = {})
    options.merge!({verify: false,headers: {:Accept => "application/jason",:Authorization => "Bearer xRKGdcC5zoU47X4Z7Kzv8y+eOczXpgc5bnzAb7wtPP5Pq9HAw1rKXvT2vsIzWY0AZ1PuegcEuqdaJZDexQMi+A=="}})
    url = URI.encode("https://api.careeronestop.org/v1/training/LM5MPWlfE8XnZ8Q/#{arg_occupation_code}/#{arg_location}/25/0/0/0/0/0/0/0/0/10")

    response = self.class.get(url,options)

    if response.key?("SchoolPrograms")

       return response["SchoolPrograms"]

    end
  end

    def get_training_count_by_occupation(arg_occupation_code,arg_location,options = {})
   #arg_occupation_code = 'Nurse'

    options.merge!({verify: false,headers: {:Accept => "application/jason",:Authorization => "Bearer xRKGdcC5zoU47X4Z7Kzv8y+eOczXpgc5bnzAb7wtPP5Pq9HAw1rKXvT2vsIzWY0AZ1PuegcEuqdaJZDexQMi+A=="}})
    url = URI.encode("https://api.careeronestop.org/v1/training/LM5MPWlfE8XnZ8Q/#{arg_occupation_code}/#{arg_location}/25/0/0/0/0/0/0/0/0/10")

    response = self.class.get(url,options)

    if response.key?("SchoolPrograms")

       return response["SchoolPrograms"].length
    else

        return 0
    end

  end

  def get_apprenticeship_by_occupation(arg_occupation_code,arg_location,options = {})
    #arg_occupation_code = 'Nurse'
    options.merge!({verify: false,headers: {:Accept => "application/jason",:Authorization => "Bearer xRKGdcC5zoU47X4Z7Kzv8y+eOczXpgc5bnzAb7wtPP5Pq9HAw1rKXvT2vsIzWY0AZ1PuegcEuqdaJZDexQMi+A=="}})
    url = URI.encode("https://api.careeronestop.org/v1/apprenticeshipfinder/LM5MPWlfE8XnZ8Q/#{arg_occupation_code}/#{arg_location}/25/0/0/0/0/0/10")
    response = self.class.get(url,options)
  end

  def get_apprenticeship_count_by_occupation(arg_occupation_code,arg_location,options = {})
    #arg_occupation_code = 'Nurse'
    options.merge!({verify: false,headers: {:Accept => "application/jason",:Authorization => "Bearer xRKGdcC5zoU47X4Z7Kzv8y+eOczXpgc5bnzAb7wtPP5Pq9HAw1rKXvT2vsIzWY0AZ1PuegcEuqdaJZDexQMi+A=="}})
    url = URI.encode("https://api.careeronestop.org/v1/apprenticeshipfinder/LM5MPWlfE8XnZ8Q/#{arg_occupation_code}/#{arg_location}/25/0/0/0/0/0/10")
    response = self.class.get(url,options)
    if response.key?("ApprenticeshipSponsorList")
       return response["RecordCount"]
    else
       return 0
    end
  end

end
