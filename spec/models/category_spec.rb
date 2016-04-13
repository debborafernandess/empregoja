require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'valid' do
    category = Category.create(name: 'PMO')
    expect(category).to be_valid
  end

  it 'invalid' do
    category = Category.create(name: '')
    expect(category).not_to be_valid
  end
end
