# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true
    validates :viewer_id, presence: true

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id

    def save!
        super
        ArtworkCollection.create(collection_id: User.find(self.viewer_id).collections.first.id, artwork_id: self.artwork_id)
    end
end