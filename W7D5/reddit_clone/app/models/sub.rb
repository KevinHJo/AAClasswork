# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  title        :string           not null
#  description  :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, presence: true
    validates :moderator_id, presence: true, uniqueness: true

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :moderator_id
end


