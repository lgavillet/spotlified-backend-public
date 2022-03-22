json.(artist, :id, :name)
json.image_url artist.image.attached? ? rails_representation_url(artist.image.variant(:thumbnail).processed) : nil
