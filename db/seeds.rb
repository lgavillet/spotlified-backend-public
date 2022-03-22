# frozen_string_literal: true

SONGS_PATH = Rails.root.join('lib', 'songs')

Dir.glob('*', base: SONGS_PATH).each do |artist_folder|
  artist = Artist.create! name: artist_folder
  artist.image.attach io: File.open(File.join(SONGS_PATH, artist_folder, 'image.jpg')), filename: 'image.jpg'

  Dir.glob('*.mp3', base: File.join(SONGS_PATH, artist_folder)).each do |song_file|
    song = artist.songs.create! title: File.basename(song_file, '.mp3')
    song.audio.attach io: File.open(File.join(SONGS_PATH, artist_folder, song_file)), filename: song_file
  end
end
