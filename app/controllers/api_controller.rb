class ApiController < ApplicationController

	skip_before_filter :verify_authenticity_token


  def index
  end

  def write
  	p = Packet.new
  	p.raw = params[:packet]
  	p.save
  	render :json => {:message => 'success'}
  end
end
