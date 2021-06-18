# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord
    COLORS = ['blank', 'red', 'orange', 'yellow', 'green', 'blue', 'purple', 'brown', 'black', 'white', 'gray', 'clear', 'tie-dye', 'glitter', 'pink', 'multicolor', 'gold', 'silver', 'black and white', 'naked']

    include ActionView::Helpers::DateHelper

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: { in: COLORS }
    validates :name, presence: true
    validates :sex, presence: true, inclusion: { in: %w(m f t n) }
    validates :description, presence: true

    def age
        time_ago_in_words(self.birth_date)
    end
end
