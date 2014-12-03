class HomeController < ApplicationController
  def index
  	@packets = Packet.all.order('created_at desc').limit(50)
  end
end
