require 'rails_helper'

describe Categorization do
  it 'does not allow category id to be blank' do
    category = Category.create!(name: "Second Cutest!")
    kitten = Kitten.new(image: "http://i.imgur.com/tOzb0dUb.jpg")
    categorization = kitten.categorizations.new(category: category)

    expect(categorization).to be_valid

    categorization.category_id = nil

    expect(categorization).to_not be_valid
  end
end