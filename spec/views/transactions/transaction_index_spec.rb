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
    visit category_transactions_path(@category.id)
  end

  it 'should display the transactions' do
    expect(page).to have_content('cocoa')
  end

  it 'should display the transaction amount' do
    expect(page).to have_content('12.1')
  end

  it 'should display the category icon' do
    expect(page).to have_css('img[src*="https://pxhere.com/en/photo/1569711"]')
  end

  it 'page path to be transaction path' do
    expect(page).to have_current_path category_transactions_path(@category.id)
  end
end
