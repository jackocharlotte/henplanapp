module ApplicationHelper
	def body_class
   		 [controller_name, action_name].join('-')
 	end

	# Returns the full title of each page.
	# From tutorial: Chapter 4 Rails-flavored Ruby - http://ruby.railstutorial.org/chapters/rails-flavored-ruby#top
	def full_title(page_title)
		main_title = "Henplan app"
		if page_title.empty?
		  main_title
		else
		  "#{main_title} | #{page_title}"
		end
	end
	
end
