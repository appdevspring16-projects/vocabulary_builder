class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :title
      t.string :more_information_url
      t.integer :author_id
      t.text :description

      t.timestamps

    end
  end
end
