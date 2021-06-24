require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before(:each) { visit new_user_url }   
  scenario 'has a new user page' do
    expect(page).to have_content("Create user")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        visit new_user_url
        fill_in "username", :with => "test"
        fill_in "password", :with => "password"
        click_on "Sign Up"
        expect(page).to have_content "test"       
    end

  end
end

feature 'logging in' do
    before :each do
        User.create!(username: 'test', password: 'password') 
    end
    scenario 'shows username on the homepage after login' do
        visit new_session_url
        fill_in "username", :with => "test"
        fill_in "password", :with => "password"
        click_on "Sign In"
        expect(page).to have_content "test"
    end

end

feature 'logging out' do
    scenario 'begins with a logged out state' do
        visit new_session_url
        expect(page).to_not have_content "test"
    end
    

    scenario 'doesn\'t show username on the homepage after logout' do
        User.create!(username: 'test', password: 'password')
        visit new_session_url
        fill_in "username", :with => "test"
        fill_in "password", :with => "password"
        click_button "Sign In"
        click_button "Sign Out"
        expect(page).to_not have_content "test" 
    end

end