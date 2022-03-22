json.(song, :id, :title)
json.audio_url song.audio.attached? ? rails_blob_url(song.audio) : nil
json.artist do
  json.partial! song.artist, as: :artist
end
