class CreateAlertTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :alert_types do |t|
      t.text :description
      t.timestamps
    end
  end
end
