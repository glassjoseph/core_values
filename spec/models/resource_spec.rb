require 'rails_helper'

RSpec.describe Resource, type: :model do
    before :each do
      @resource = create(:resource)
    end

    it "has resource_type" do
      expect(@resource).to respond_to(:resource_type)
    end

    it "has content" do
      expect(@resource).to respond_to(:content)
    end

    it "has notes" do
      expect(@resource).to respond_to(:notes)
    end

    it "belongs to user" do
      expect(@resource.user).to eq(User.first)
    end
end
