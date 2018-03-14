module ClientsHelper
	def get_student_name(arg_id)

		@client = Client.where("id = 3 ", arg_id)
		@name = @client.first.first_name + ', ' + @client.first.last_name
		
	end
end
