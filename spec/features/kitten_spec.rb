require 'rails_helper'

feature 'Kittens' do

  scenario 'User can categorize kittens' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)

    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Cutest!")
    end
  end

  scenario 'User must select a category' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)

    find(".kitten-link").click
    click_on "Add Category"

    expect(page).to have_content("Category can't be blank")
  end

  scenario 'User cannot select an assigned category' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)

    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    expect(page).to have_content("Category has already been taken")
  end

end