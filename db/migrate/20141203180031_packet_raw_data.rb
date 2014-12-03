class PacketRawData < ActiveRecord::Migration
  def change
  	add_column :packets, :raw, :string
  end
end
