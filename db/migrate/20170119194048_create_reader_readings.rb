class CreateReaderReadings < ActiveRecord::Migration
  def change
    create_table :reader_readings do |t|
      t.integer :reader_id
      t.integer :reading_id

      t.timestamps

    end
  end
end
