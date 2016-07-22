class Responder < ActiveRecord::Base
	
	has_one :emergency
	ResponderTypes = [
				"Fire",
				"Police",
				"Medical"
				]

	ResponderCities = [
				"Indore",
				"Bhopal",
				"Mumbai",
				"Delhi",
				"Kerala"
				]
end
