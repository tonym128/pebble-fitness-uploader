class CreateHealthRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :health_records do |t|
      t.references :user, foreign_key: true
      t.datetime :timestamp
      t.integer :steps
      t.integer :yaw
      t.integer :pitch
      t.integer :vmc
      t.integer :light
      t.integer :activity
      t.integer :activity
      t.integer :hrbpm

      t.timestamps
    end
  end
end
