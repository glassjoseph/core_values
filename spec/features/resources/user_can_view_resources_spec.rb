require "rails_helper"

RSpec.describe "user can view resources" do

  scenario "user can see resources" do
    user = create(:user)
    user.resources.create(resource_type: "quote", content: "Eat your veggies", notes: "truest words")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit resources_path

    expect(page).to have_content("Resources")
    expect(page).to have_link("Add New Resource", href: new_resource_path)
    within (".card") do
      expect(page).to have_content("Notes")
      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
    end
  end
end
