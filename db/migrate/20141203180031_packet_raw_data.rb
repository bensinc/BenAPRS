class PacketRawData < ActiveRecord::Migration
  def change
  	add_column :packets, :raw, :text
  end
end
