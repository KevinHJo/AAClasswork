require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'new' do
        it "renders new user form" do
            expect(page).to have_content ("Create a user")
        end

        it "asks for a username" do
            expect(page).to have_content ("Username:")
        end

        it "asks for a password" do
            expect(page).to have_content ("Password:")
        end
    end
end
