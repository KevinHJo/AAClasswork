# == Schema Information
#
# Table name: albums
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  year    :integer          not null
#  live?   :boolean          not null
#  band_id :integer          not null
#
class Album < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:band_id] }
    validates :year, presence: true
    validates :live?, inclusion: { in: [true, false] }

    belongs_to :band
end