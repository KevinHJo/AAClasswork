# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Collection < ApplicationRecord
    belongs_to :user
    has_many :artwork_collections,
        class_name: :ArtworkCollection,
        foreign_key: :collection_id

    has_many :artworks,
        through: :artwork_collections,
        source: :artwork
end
