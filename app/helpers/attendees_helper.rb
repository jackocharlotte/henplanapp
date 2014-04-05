module AttendeesHelper
	def att_total
		@attendees = Attendee.all
		@attendees.count
	end
end
