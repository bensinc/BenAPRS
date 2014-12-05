def decode_position(message, timestamp)
	decoded = Hash.new
	decoded['format'] = 'position'

	position_data = message[1..26]
	
	if (timestamp)
		time_data = message[1..7]
		case time_data[6]
			when 'z'
				decoded['timestamp'] = "#{Time.now.utc.strftime('%m')}/#{time_data[0..1]}/#{Time.now.utc.year} #{time_data[2..3]}:#{time_data[4..5]}z"
			when '/'
				decoded['timestamp'] = "#{Time.now.utc.strftime('%m/%d/%Y')} #{time_data[2..3]}:#{time_data[4..5]}"
			when 'h'
				decoded['timestamp'] = "#{Time.now.utc.strftime('%m/%d/%Y')} #{time_data[2..3]}:#{time_data[4..5]}z"
		end
		position_data = position_data[7..-1]		
	end

	# 4125.70N/09 255.50W_
   # 01234567890 12345678
	decoded['symbol_code'] = position_data[8]
	decoded['symbol_table_id'] = position_data[-1]

	

	lat_deg = position_data[0..1]
	lat_min = position_data[2..6]

	

	latitude = lat_deg.to_f + (lat_min.to_f / 60.0)
	latitude = -latitude if position_data[7] == 'E'

	decoded['latitude'] = latitude

	lon_deg = position_data[9..11]
	lon_min = position_data[12..16]

	longitude = lon_deg.to_f + (lon_min.to_f / 60.0)

	longitude = -longitude if position_data[17] == 'W'

	decoded['longitude'] = longitude

	return decoded
end

# N0MPM-4>APTT4,KC0NFA-2*,W0AK-1*,WIDE2*:@041441z4125.70N/09255.50W_109/004g008t025r000p000P000h71b10260.