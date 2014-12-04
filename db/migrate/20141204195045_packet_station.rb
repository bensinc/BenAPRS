class PacketStation < ActiveRecord::Migration
  def change
  	add_column :packets, :station_id, :integer
  end
end
