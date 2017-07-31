require "rails_helper"

RSpec.describe "user can create a daily" do

  scenario "user can create a daily" do
    user = create(:user)
    user.dailies << create(:daily_with_scores, goal: "Exercise?")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dailies_path

    click_on "Add New Daily"
    fill_in "Goal", with: "Study?"
    click_on "Add Daily"

    expect(current_path).to eq(dailies_path)
    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_link("Exercise?", href: '/dailies/1')
      expect(page).to have_link("Study?", href: '/dailies/2')
    end
    expect(page).to have_link("Add New Daily", href: new_daily_path)
  end
end
