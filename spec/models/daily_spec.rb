require 'rails_helper'

RSpec.describe Daily, type: :model do
  before :each do
    @daily = create(:daily_with_scores)
  end

  it "has a goal and supporter" do
    expect(@daily).to respond_to(:goal)
    expect(@daily.supporter).to eq(Supporter.first)
  end

  it "belongs to user" do
    expect(@daily.user).to eq(User.first)
  end
end
