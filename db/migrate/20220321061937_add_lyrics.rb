class AddLyrics < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :lyrics, :string
    Song.all.each do |song|
      song.update lyrics: Faker::Lorem.paragraphs(number: 10).join('<br/>')
    end
  end
end
