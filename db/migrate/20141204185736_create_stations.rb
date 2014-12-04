class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
    	t.column :callsign, :string
    	t.column :latitude, :double
    	t.column :longitude, :double
    	t.column :user_id, :integer
    	t.column :message, :string
      t.timestamps
    end
  end
end
