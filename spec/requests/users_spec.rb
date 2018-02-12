require 'rails_helper'

RSpec.describe User, type: :request do

  it 'allows new user creation' do
    visit '/signup'
    expect(current_url).to eq(signup_url)
    fill_in 'Email', with: 'fake@fake.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    expect(current_url).to eq(login_url)
    fill_in 'email', with: 'fake@fake.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(current_url).to eq(root_url)
    expect(page).to have_text('You have logged in.')
  end

  it 'does not allow duplicate user creation' do
    user = FactoryGirl.create(:user, password: 'password')
    visit '/signup'
    expect(current_url).to eq(signup_url)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    expect(current_url).to eq(signup_url)
  end


#   # let(:user) { build(:user) }
#   # let(:valid_attributes) do
#   #   attributes_for(:user, password_confirmation: user.password)
#   # end
#   def sign_in_as(email)
#     post login_url, params: { sig: users(email).perishable_signature }
#   end
#
#   describe 'POST /users' do
#     context 'when request is valid' do
#       before { post '/users', params: valid_attributes }
#
#       it 'creates a User and redirects to Dashboard' do
#         # expect(response).to have_http_status(302)
#         # follow_redirect!
#         # expect(response.body).to include("You have logged in.")
#       end
#     end
#
#     context 'when request is invalid' do
#       # before { post '/users', params: nil}
#       it 'redirects to login page' do
#       #   expect(response).to have_http_status(302)
#       #   follow_redirect!
#
#       end
#     end
#   end
#
#   describe 'using login' do
#     context 'when credentials are valid' do
#       setup { sign_in_as 'jim@jim.com' }
#       it 'responds with message and redirects to dashboard' do
#         expect(response.body).to include('You have logged in.')
#       end
#     end
#
#     context 'when credentials are not valid' do
#       it 'responds with message and redirects to login' do
#         true
#       end
#     end
#   end
end
