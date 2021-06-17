# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :artist_id, presence: true
    validates :image_url, presence: true

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id

    has_many :shares,
        class_name: :ArtworkShare,
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end
