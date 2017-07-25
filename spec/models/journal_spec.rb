require 'rails_helper'

RSpec.describe Journal, type: :model do
  before :each do
    @journal = create(:journal)
  end

  it "has title and content" do
    expect(@journal).to respond_to(:title)
    expect(@journal).to respond_to(:content)
  end

  it "belongs to daily and user" do
    expect(@journal.daily).to eq(Daily.first)
    expect(@journal.user).to eq(User.first)
  end
end
