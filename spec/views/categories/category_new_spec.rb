require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Bayo', email: 'bayo@example.com', password: 'password')
    within('form') do
      fill_in 'Email', with: 'bayo@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    @category = Category.create(name: 'test', icon: 'https://pxhere.com/en/photo/1569711', user: @user)
    visit new_category_path
  end

  it 'should display the new category form' do
    expect(page).to have_content('Add New Category')
  end
end
