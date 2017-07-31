require "rails_helper"

RSpec.describe "user can delete dailies" do

  scenario "user can edit daily" do
    user = create(:user)
    user.dailies << create(:daily_with_scores)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    daily = user.dailies.first
    visit daily_path(daily)

    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_content("Exercise?")
    end

    click_on "Delete Goal"

    expect(current_path).to eq(dailies_path)
    expect(page).to have_content("Goal Deleted")
  end
end
