class AddColumnToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :ip, :string
    add_column :devices, :city, :string
    add_column :devices, :state, :string
    add_column :devices, :country, :string
    add_column :devices, :postcode, :string
    add_column :devices, :isp, :string
    add_column :devices, :created_at, :datetime, null: false
    add_column :devices, :updated_at, :datetime, null: false
  end
end
