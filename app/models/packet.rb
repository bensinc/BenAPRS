require 'APRSParser'
include APRSParser

class Packet < ActiveRecord::Base
	belongs_to :station
	after_create :parse

	def parse
		parsed = APRSParser.parse(self.raw)
		puts parsed
		station = Station.find_by(callsign: parsed['from'])
		unless station
			station = Station.new
		end

		station.callsign = parsed['from']
		station.latitude = parsed['latitude']
		station.longitude = parsed['longitude']
		station.save

		self.station_id = station.id
		self.save

	end
end
