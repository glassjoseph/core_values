require "rails_helper"

RSpec.describe "user can create resources" do

  scenario "user can create a resource" do

    user = create(:user)
    # user.resources.create(resource_type: "quote", content: "Eat your veggies", notes: "truest words")
    # resource = user.resources.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit resources_path

    click_on "Add New Resource"
    choose("resource_resource_type_quote")

    fill_in "Content", with: "This is a quote"
    fill_in "Notes", with: "This is a note"

    click_on "Add Resource"

    expect(current_path).to eq(resources_path)
    expect(page).to have_content("Resource Created!")
    within '.card' do
      expect(page).to have_content("This is a quote")
      expect(page).to have_content("This is a note")
    end

  end
end
