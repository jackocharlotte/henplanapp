module ApplicationHelper
	def body_class
   		 [controller_name, action_name].join('-')
 	end

	# Returns the full title of each page.
	def full_title(page_title)
		main_title = "Henplan app"
		if page_title.empty?
		  main_title
		else
		  "#{main_title} | #{page_title}"
		end
	end

	def typekit_include_tag apikey
	  javascript_include_tag("//use.typekit.com/#{bqh8lwi}.js") +
	  javascript_tag("try{Typekit.load()}catch(e){}")
	end
	
end
