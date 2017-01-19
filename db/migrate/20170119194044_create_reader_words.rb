class CreateReaderWords < ActiveRecord::Migration
  def change
    create_table :reader_words do |t|
      t.integer :reader_id
      t.integer :word_id
      t.integer :reader_readings_id
      t.text :context
      t.integer :favorite

      t.timestamps

    end
  end
end
