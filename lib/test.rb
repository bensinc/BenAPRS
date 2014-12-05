require_relative 'APRSParser'
include APRSParser

data = "BHCNTY>APTT4,W0MG-5*,W0AK-1*,WIDE2*:!4235.93N/09222.57W#PHG51306/N. Black Hawk County Digi W0HHF@arr"

packet = APRSParser.parse(data)
puts packet

# AC0BD>S32U6T,W0AK-1*,WIDE1*,WIDE2-1:'yGMl\(-/>Mike de Polk City IA=.
# T1TV4T
# S32U6T
# KC0HWG-3>T1PP9V,N0NHB*,KC0UNH*,W0AK-1*,WIDE2-1:'{OHl .#/"7F}Pacific Junction Iowa Digi kc0hwg.digi@gmail.com
# KC0ZMX-7>T1SU8Y,WIDE1-1,WIDE2-2:'yPW. .v/> ben@bensinclair.com=.

# N0NHB>T1PV1R,AA0OS-2*,KC0UNH*,W0AK-1*,WIDE2*:'{]:l .#/]Red Oak,Iowa Digipeater.

# BHCNTY>APTT4,W0MG-5*,W0AK-1*,WIDE2*:!4235.93N/09222.57W#PHG51306/N. Black Hawk County Digi W0HHF@arr