require "rails_helper"

RSpec.describe "user can log in  in" do
  scenario "user can log in" do
    user = create(:user)
    visit "/login"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"

    expect(current_path).to eq('/')
    expect(page).to have_content("Login Successful!")
    expect(page).to have_content("Welcome, #{user.first_name}")
  end

  scenario "user cannot log in without email" do
    user = create(:user)
    visit "/login"

    fill_in "Password", with: user.password
    click_on "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Login Unsuccessful")
    expect(page).to_not have_content("Welcome, #{user.first_name}")
  end

  scenario "user cannot log in without password" do
    user = create(:user)
    visit "/login"

    fill_in "Email", with: user.email
    click_on "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Login Unsuccessful")
    expect(page).to_not have_content("Welcome, #{user.first_name}")
  end

  scenario "user cannot log in with incorrect password" do
    user = create(:user)
    visit "/login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "12345"
    click_on "Login"

    expect(current_path).to eq('/login')
    expect(page).to have_content("Login Unsuccessful")
    expect(page).to_not have_content("Welcome, #{user.first_name}")
  end
end
