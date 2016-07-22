class Emergency < ActiveRecord::Base
	has_many :responders
	# validates :reason, presence: true
	validates_presence_of :reason, :city
end
