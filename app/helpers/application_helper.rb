module ApplicationHelper
	
	# Returns the full title on a per-page basis.
	def full_title (page_title = '')
		if page_title.empty?
			"Sample App"
		else
			page_title + " | Sample App"
		end
	end

end
