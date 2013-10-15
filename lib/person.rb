class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def have_bike
		!@bike.nil?
	end

	def rent_bike_from(station)
		station.release_bike
	end

end