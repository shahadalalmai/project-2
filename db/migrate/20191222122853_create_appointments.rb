class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :clinic
      t.date :date
      t.timestamp :time

      t.timestamps
    end
  end
end
