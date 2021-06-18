# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artist_id,
        dependent: :destroy
        
    has_many :shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :shares,
        source: :artwork

    has_many :collections,
        class_name: :Collection,
        foreign_key: :user_id

    has_many :collected_arts,
        through: :collections,
        source: :artworks

    has_many :comments,
        class_name: :Comment,
        foreign_key: :author_id,
        dependent: :destroy

    has_many :likes,
        foreign_key: :author_id

    def save!
        super
        Collection.create(name: "#{self.username}\'s collection", user_id: self.id)
    end
end
