class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.belongs_to :alert_type, index: true
      t.belongs_to :user, index: true
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
