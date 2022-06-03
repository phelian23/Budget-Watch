require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.new(name: 'Bayo', email: 'bayo@example.com', password: 'password')
    @category = Category.new(name: 'test', icon: 'https://pxhere.com/en/photo/1569711', user: @user)
  end
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should be unique' do
    @user = User.new(name: 'Bayo', email: 'bayo@email.com', password: 'password')
    @category = Category.new(name: 'test1', icon: 'https://pxhere.com/en/photo/1569711', user: @user)
    @category.save
    subject.name = 'test1'
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a user' do
    expect(subject).to respond_to(:user)
  end
end
