require 'csv'

class ExportsController < ApplicationController
  def export_data
    respond_to do |format|
      format.csv { send_data generate_csv, filename: "data-#{DateTime.now}.csv" }
    end
  end

  private

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << %w[Artist LP Song Author]

      Artist.includes(lps: { songs: :authors }).each do |artist|
        artist.lps.each do |lp|
          lp.songs.each do |song|
            song.authors.each do |author|
              csv << [artist.name, lp.name, song.name, author.name]
            end
            csv << [artist.name, lp.name, song.name, ''] if song.authors.empty?
          end
          csv << [artist.name, lp.name, '', ''] if lp.songs.empty?
        end
        csv << [artist.name, '', '', ''] if artist.lps.empty?
      end
    end
  end
end
