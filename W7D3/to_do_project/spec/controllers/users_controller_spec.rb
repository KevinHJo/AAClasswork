require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it "renders new user form" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST #create' do 
        # before :each do
        #     create(:user)
        #     allow(subject).to receive(:current_user).and_return(User.last)
        # end

        let(:valid_params) { {user: { username: 'good', password: 'password' }}}
        let(:invalid_params) { {user: { username: 'bad', password: 'short' }}}

        context 'with valid params' do
            before(:each) { post :create, params: valid_params }
            
            it 'adds user to the database' do
                expect(User.last.username).to eq('good')
            end
            
            it 'redirects to user\'s show page' do
                expect(response).to redirect_to(user_url(User.last))
            end
        end
        
        context 'with invalid params' do
            before(:each) { post :create, params: invalid_params }
            
            it 'redirects to new user form' do
                expect(response).to redirect_to(new_user_url)
            end
        end
    end

    describe 'GET #show' do
        it 'renders correct user\'s page' do
            user = User.create!(username: 'test', password: 'password')
            get :show, id: user.id
            
            expect(response).to render_template(:show)
        end
    end
end
