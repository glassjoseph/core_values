require 'rails_helper'

RSpec.describe Score, type: :model do
  before :each do
    @score = create(:score)
  end

  it "has score and date" do
    expect(@score).to respond_to(:score)
    expect(@score).to respond_to(:date)
  end

  it "belongs to daily" do
    expect(@score.daily).to eq(Daily.first)
  end
end
