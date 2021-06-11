require "securerandom"

class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true
    validates :user_id, presence: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    def self.random_code
        rand = "shorturl.at/#{SecureRandom.urlsafe_base64}"

        until !ShortenedUrl.exists?(short_url:rand)
            rand = "shorturl.at/#{SecureRandom.urlsafe_base64}"
        end

        rand
    end

    def self.create!(user, extended_url)
        ShortenedUrl.create(user_id:user.id, long_url:extended_url, short_url: ShortenedUrl.random_code)
    end

end