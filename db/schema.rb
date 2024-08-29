# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_828_212_502) do
  create_table 'artists', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'authors_songs', id: false, force: :cascade do |t|
    t.integer 'author_id', null: false
    t.integer 'song_id', null: false
    t.index %w[author_id song_id], name: 'index_authors_songs_on_author_id_and_song_id', unique: true
    t.index ['author_id'], name: 'index_authors_songs_on_author_id'
    t.index ['song_id'], name: 'index_authors_songs_on_song_id'
  end

  create_table 'lps', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.text 'description'
    t.integer 'artist_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_lps_on_artist_id'
  end

  create_table 'songs', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.integer 'lp_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['lp_id'], name: 'index_songs_on_lp_id'
  end

  add_foreign_key 'authors_songs', 'authors'
  add_foreign_key 'authors_songs', 'songs'
  add_foreign_key 'lps', 'artists'
  add_foreign_key 'songs', 'lps'
end
