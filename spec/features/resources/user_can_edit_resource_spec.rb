require "rails_helper"

RSpec.describe "user can edit resources" do

  scenario "user can edit resource" do
    user = create(:user)
    user.resources.create(resource_type: "quote", content: "Eat your veggies", notes: "truest words")
    resource = user.resources.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit resources_path

    within (".card") do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_resource_path(resource))
    expect(page).to have_content("Image")
    expect(page).to have_content("Quote")
    expect(page).to have_content("Link")
    expect(page).to have_content("Other")
    expect(page).to have_content("Content")
    expect(page).to have_content("Eat your veggies")
    expect(page).to have_content("Notes")
    expect(page).to have_content("truest words")

    fill_in "Content", with: "Exercise every day"

    click_on "Edit Resource"

    expect(current_path).to eq(resources_path)
    expect(page).to have_content("Resource Updated!")
    # within '.card' do
      # expect(page).to have_content("Exercise every day")
    # end
  end
end
