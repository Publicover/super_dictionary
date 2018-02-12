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
end
