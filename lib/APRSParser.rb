

module APRSParser
	require_relative 'mic_e_address_decoder.rb'
	require_relative 'position_decoder.rb'

	def parse(data)
		packet = Hash.new

		from = data.split('>')[0]
		packet['from'] = from

		to_path = data.split('>')[1].split(':')[0]
		to = to_path.split(',')[0]
		packet['to'] = to

		path = to_path.split(',')[1..-1].join(',')
		packet['path'] = path

		message = data.split(':')[1..-1].join

		case message[0]
			when "!", "="
				packet.merge!(decode_position(message, false))
			when "/", "@"
				packet.merge!(decode_position(message, true))
			when "'", "`"
				packet.merge!(decode_mic_e(to, message))
			else
				packet['message'] = message
		end





		return packet
	end

	




end

# AC0BD>T1TV4T,W0AK-1*,WIDE1*,WIDE2-1:'yGMl\(-/>Mike de Polk City IA=.

