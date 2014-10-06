module ApplicationHelper

	def is_active?()
		current_page?() ? "active" : ""
	end

end
