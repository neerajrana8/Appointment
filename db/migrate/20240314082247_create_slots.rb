class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.boolean :booked, null: false , default: false
      t.string :start_time
      t.references :available, null: false, foreign_key: true
      t.timestamps
    end
  end
end
