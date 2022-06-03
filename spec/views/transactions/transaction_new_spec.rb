require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Bayo', email: 'bayo@example.com', password: 'password')
    @category = Category.create(name: 'test', icon: 'https://pxhere.com/en/photo/1569711', user: @user)
    @transaction = Transaction.create(name: 'cocoa', amount: 12.1, user: @user, category: @category)
    within('form') do
      fill_in 'Email', with: 'bayo@example.com'
      fill_in 'Password', with: 'password'
    end

    click_button 'Log in'
    visit new_category_transaction_path(@category.id)
  end

  it 'should display the new transaction form' do
    expect(page).to have_content('Add New Transaction')
  end
end
