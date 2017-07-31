require "rails_helper"

RSpec.describe "user can view a daily" do
  scenario "user can see one daily" do
    user = create(:user)
    user.dailies << create(:daily_with_scores, goal: "Exercise?")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dailies_path
    first('td').click_link('Exercise?')

    expect(page).to have_css('table#dailies-table')
    within '#dailies-table' do
      expect(page).to have_content("Did I do my best to")
      expect(page).to have_content("Weekly Average")
      expect(page).to have_content("Exercise?")
    end
    expect(page).to have_link("Edit Goal")
    expect(page).to have_link("Delete Goal")
  end
end
