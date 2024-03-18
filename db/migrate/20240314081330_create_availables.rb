class CreateAvailables < ActiveRecord::Migration[7.0]
  def change
    create_table :availables do |t|
      t.integer :day
      t.string :start_time
      t.string :end_time
      t.references :coach, null: false, foreign_key: false

      t.timestamps
    end
  end
end
