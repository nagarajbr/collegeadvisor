module ApplicationHelper
	def set_subheader(arg_header)
		# output = "<h4 class="
		# output = output + "subheader"
		# output = output + "> #{arg_header} </h4>"
		# output = output.html_safe
		if arg_header.present?
			output = content_tag(:h4,arg_header ,class:"subheader")
			output = output + content_tag(:hr)
		end
	end
end
