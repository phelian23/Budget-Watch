require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    @user = User.new(name: 'Bayo', email: 'bayo@mail.com', password: 'password')
    @category = Category.new(name: 'Travel', icon: 'https://pxhere.com/en/photo/1569711', user: @user)
    @transaction = Transaction.new(name: 'Senegal', amount: 12.1, user: @user, category: @category)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be numeric value' do
    expect(subject.amount).to be_kind_of Numeric
  end

  it 'amount should be is greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a category' do
    expect(subject).to respond_to(:category)
  end
end
