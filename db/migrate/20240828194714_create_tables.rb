# Migration for create basic tables
class CreateTables < ActiveRecord::Migration[7.1]
  def up
    create_table :artists do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :authors do |t|
      t.string :name

      t.timestamps
    end

    create_table :lps do |t|
      t.string :name
      t.text :description
      t.references :artist, foreign_key: true

      t.timestamps
    end

    create_table :songs do |t|
      t.string :name
      t.references :lp, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :artists
    drop_table :authors
    drop_table :lps
    drop_table :songs
  end
end
