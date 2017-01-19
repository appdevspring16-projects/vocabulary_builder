class CreateReadingWords < ActiveRecord::Migration
  def change
    create_table :reading_words do |t|
      t.integer :word_id
      t.integer :reading_id

      t.timestamps

    end
  end
end
