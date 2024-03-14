class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :slot, null: false, foreign_key: true
      t.references :coach, null: false, foreign_key: false
      t.references :patient, null: false, foreign_key: false
      t.timestamps

    end

  end
end
