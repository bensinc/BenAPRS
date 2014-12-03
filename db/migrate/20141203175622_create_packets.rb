class CreatePackets < ActiveRecord::Migration
  def change
    create_table :packets do |t|
    	t.column :from, :string
    	t.column :to, :string
    	t.column :path, :string
    	t.column :message, :string
    	t.column :user_id, :integer
      t.timestamps
    end
  end
end
