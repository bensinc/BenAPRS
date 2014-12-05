require '../config/environment.rb'

for p in Packet.all
	p.parse
end