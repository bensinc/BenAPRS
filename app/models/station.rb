class Station < ActiveRecord::Base
	has_many :packets
end
