# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :integer
#
class Like < ApplicationRecord

    belongs_to :likeable,
        polymorphic:true

    belongs_to :author,
        class_name: :User,
        foreign_key: :author_id
end
