class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
    	t.decimal :latitude, precision: 10, scale: 6
    	t.decimal :longitude, precision: 10, scale: 6
    	t.references :user, index: true
    end
  end
end
