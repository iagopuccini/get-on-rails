class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :title, null: false
      t.string :release_type
      t.integer :year
      t.integer :discog_id

      t.timestamps

      t.belongs_to :artist, index: true, null: false
    end
  end
end