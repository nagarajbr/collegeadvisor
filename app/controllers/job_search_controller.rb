class JobSearchController < ApplicationController
	def index
     @jobs  = IndeedWebService.new().job_by_location()
	end

   def show

   if params.key?("keyword")
      keyword = params["keyword"]
      location = params["location"]
   else
      keyword = params[:id]
      location = "little Rock , AR"
   end

   @job_listing_array = job_listing(keyword,location)


   end


  def job_listing (arg_keyword,arg_location)
       occupation = arg_keyword
       location = arg_location.split(",") if arg_location.present?

        city = location[0]
        state = location[1]


    job_listing_array = []
    # jobs for Indeed
    indeed_ws = IndeedWebService.new()

    job_listings = indeed_ws.job_by_location(occupation, city, state)

     

    if !job_listings.empty? && job_listings["response"]["totalresults"].to_i > 0
             job_listings["response"]["results"]["result"].each do |key,val|

              job_listing_hash = { :jobtitle => key["jobtitle"],
                                   :company => key["company"],
                                   :formattedLocation => key["formattedLocation"],
                                   :snippet => key["snippet"],
                                   :formattedRelativeTime => key["formattedRelativeTime"],
                                   :source => key["source"],
                                   :url => key["url"] }

              job_listing_array.push(job_listing_hash)
            end
    end

    # # jobs for USJobs
    # usjob_ws = UsJobsWebService.new()
    # job_listings = usjob_ws.job_by_location(occupation, city, state)

    # Rails.logger.debug("===========#{job_listings.inspect}")

    # if !job_listings.empty?
    #          job_listings.each do |key,val|

    #           job_listing_hash = { :jobtitle => key["position_title"],
    #                                :company => key["organization_name"],
    #                                :formattedLocation => key["locations"],
    #                                :snippet => '',
    #                                :formattedRelativeTime => '',
    #                                :source => 'UsJobs',
    #                                :url => key["url"] }

    #           job_listing_array.push(job_listing_hash)
    #         end
    # end
    return job_listing_array
   end
  helper_method :job_listing

end
