class HomeController < ApplicationController
  def index  	
  	@stations = Station.all.order('updated_at desc').limit(50)
  end

  def stations
  	@stations = Station.all.order('updated_at desc').limit(50)
  end

  def packets
	@packets = Packet.all.order('created_at desc').limit(50)
  end
end
