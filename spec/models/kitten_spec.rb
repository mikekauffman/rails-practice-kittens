require 'rails_helper'

describe Kitten do
  it 'allows a kitten to display their associated categories alphabetically' do
    cat_1 = Category.create!(name: "Second Cutest!")
    cat_2 = Category.create!(name: "Cutest!")
    kitten = Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")
    Categorization.create!(kitten_id: kitten.id, category_id: cat_1.id)
    Categorization.create!(kitten_id: kitten.id, category_id: cat_2.id)

    actual_names = kitten.categories.map { |category| category.name }
    expect(actual_names).to eq(["Cutest!", "Second Cutest!"])
  end
end