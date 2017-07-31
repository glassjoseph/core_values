require "rails_helper"

RSpec.describe "user can edit dailies" do

  scenario "user can edit daily" do
    user = create(:user_with_dailies)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    daily = user.dailies.first
    visit daily_path(daily)

    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_content("Exercise?")
    end

    click_on "Edit Goal"

    expect(current_path).to eq(edit_daily_path(daily))

    fill_in "Goal", with: "Study?"
    click_on "Edit Goal"

    expect(page).to have_content("Goal Updated!")
    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_content("Study?")
    end
    expect(page).to have_link("Edit Goal")
    expect(page).to have_link("Delete Goal")
  end
end
