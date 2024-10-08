# frozen_string_literal: true

# Migration for create intermediate table between authors and songs
class AuthorsSongsTable < ActiveRecord::Migration[7.1]
  def up
    create_table :authors_songs, id: false do |t|
      t.references :author, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
    end

    add_index :authors_songs, %i[author_id song_id], unique: true
  end

  def down
    remove_index :authors_songs, column: %i[author_id song_id]
    drop_table :authors_songs
  end
end
