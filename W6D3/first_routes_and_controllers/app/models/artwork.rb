class Artwork < ApplicationRecord

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id
end