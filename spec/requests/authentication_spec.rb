require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  it 'allows users to log in' do
    user = FactoryGirl.create(:user, password: 'password')
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
    expect(current_url).to eq(root_url)
    expect(page).to have_text('You have logged in.')
  end

  it 'does not allow public root access' do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
  end
end
