class AddFieldAddressToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :address, :Text
  end
end
