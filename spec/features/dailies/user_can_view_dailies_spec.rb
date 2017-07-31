require "rails_helper"

RSpec.describe "user can view dailies" do

  scenario "user can see dailies" do
    user = create(:user)
    user.dailies << create(:daily_with_scores, goal: "Exercise?")
    user.dailies << create(:daily_with_scores, goal: "Study?")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dailies_path

    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_link("Exercise?")
      expect(page).to have_link("Study?")
    end
    expect(page).to have_link("Add New Daily", href: new_daily_path)
  end
end
