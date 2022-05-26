class CreateKintais < ActiveRecord::Migration[6.0]
  def change
    create_table :kintais do |t|
      t.time :start_time
      t.time :end_time
      t.time :total_time
      t.time :over_time
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
