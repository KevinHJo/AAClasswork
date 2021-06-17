# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  body       :string           not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :author,
        class_name: :User,
        foreign_key: :author_id
    
    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id
end