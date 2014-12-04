
# Table of latitude values from the APRS protocol reference
MIC_E_ADDRESS = {
	'0' => [0, 0, 'S', 0, 'E'],
	'1' => [1, 0, 'S', 0, 'E'],
	'2' => [2, 0, 'S', 0, 'E'],
	'3' => [3, 0, 'S', 0, 'E'],
	'4' => [4, 0, 'S', 0, 'E'],
	'5' => [5, 0, 'S', 0, 'E'],
	'6' => [6, 0, 'S', 0, 'E'],
	'7' => [7, 0, 'S', 0, 'E'],
	'8' => [8, 0, 'S', 0, 'E'],
	'9' => [8, 0, 'S', 0, 'E'],
	'A' => [0, 1, nil, nil, nil],
	'B' => [1, 1, nil, nil, nil],
	'C' => [2, 1, nil, nil, nil],
	'D' => [3, 1, nil, nil, nil],
	'E' => [4, 1, nil, nil, nil],
	'F' => [5, 1, nil, nil, nil],
	'G' => [6, 1, nil, nil, nil],

	'H' => [7, 1, nil, nil, nil],
	'I' => [8, 1, nil, nil, nil],
	'J' => [9, 1, nil, nil, nil],
	'K' => [' ', 1, nil, nil, nil],
	'L' => [' ', 1, 'S', 0, 'E'],

	'P' => [0, 1, 'N', 100, 'W'],
	'Q' => [1, 1, 'N', 100, 'W'],
	'R' => [2, 1, 'N', 100, 'W'],
	'S' => [3, 1, 'N', 100, 'W'],
	'T' => [4, 1, 'N', 100, 'W'],
	'U' => [5, 1, 'N', 100, 'W'],
	'V' => [6, 1, 'N', 100, 'W'],
	'W' => [7, 1, 'N', 100, 'W'],
	'X' => [8, 1, 'N', 100, 'W'],
	'Y' => [9, 1, 'N', 100, 'W'],
	'Z' => [' ', 1, 'N', 100, 'W']
}


# Decodes a Mic-E packet
def decode_mic_e(to, message)
		puts "mic e"
		mic_e = Hash.new
		mic_e['format'] = 'Mic-E'		

		if (message.size < 9)
			mic_e['error'] = 'Invalid Mic-E packet'
			return(mic_e)
		end

		lat = ''
		lon = ''
		n_s = nil
		w_e = nil
		lon_offset = 0



		to.chars.each_with_index do |c, i|
			data = MIC_E_ADDRESS[c]
			lat << data[0].to_s
			# puts data.join(',')
			case i
				when 3
					n_s = data[2]
				when 4
					lon_offset = data[3]
				when 5
					w_e = data[4]
			end			
		end

		deg = lat[0..1]
		min = "#{lat[2..3]}.#{lat[4..5]}"
		

		latitude = deg.to_f + (min.to_f / 60.0)
		latitude = -latitude if n_s == 'S'

		mic_e['latitude'] = latitude

		data = message[0..8]


		deg = message[1].ord - 28
		deg += lon_offset

		if deg >= 180 and deg <= 189
			deg -= 80
		elsif deg >= 190 and deg <= 199
			deg -= 190
		end

		min = message[2].ord - 28
		min -= 60 if min >= 60

		hun = message[3].ord - 28

		longitude = deg.to_f + ("#{min}.#{hun}".to_f / 60.0)
		longitude = -longitude if w_e == 'W'

		mic_e['longitude'] = longitude 

		mic_e['symbol_code'] = message[7]
		mic_e['symbol_table_id'] = message[8]

		mic_e['message'] = message[9..-1]

		# TODO: Decode speed and course
		# TODO: Decode Mic-E status
		# TODO: Decode device type

		return(mic_e)
	end


