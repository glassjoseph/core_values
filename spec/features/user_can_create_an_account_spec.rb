require "rails_helper"

RSpec.describe "user can create an account in" do
  scenario "unauthenticated user can register" do
    visit "/"
    click_on "Create an Account"
    expect(current_path).to eq(new_user_path)

    fill_in "first_name", with: "James"
    fill_in "last_name", with: "Cooper"
    fill_in "Email", with: "j@j.com"
    fill_in "Password", with: "password"
    click_on "Register"

    expect(current_path).to eq('/home')
    expect(User.count).to eq(1)
  end

  scenario "user cannot register without email" do

    visit "/"
    click_on "Create an Account"
    expect(page).to have_content("Create an Account")

    fill_in "first_name", with: "James"
    fill_in "last_name", with: "Cooper"
    fill_in "Password", with: "password"
    click_on "Register"

    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
  end

  scenario "user cannot register without password" do
    visit "/"
    click_on "Create an Account"
    expect(current_path).to eq(new_user_path)

    fill_in "first_name", with: "James"
    fill_in "last_name", with: "Cooper"
    fill_in "Email", with: "i@i.com"
    click_on "Register"

    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
  end

  scenario "user cannot register with a taken email" do

    create(:user, email: "i@i.com", password: "password")
    visit "/"
    click_on "Create an Account"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "i@i.com"
    fill_in "Password", with: "password"
    click_on "Register"
    expect(page).to have_content("Email already taken")
    expect(current_path).to eq('/users')
    expect(User.count).to eq(1)
  end


end
