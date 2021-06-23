FactoryBot.define do
    factory :user do
        username { Faker::TvShows::BigBangTheory.character }
        password { 'password' }
    end
end