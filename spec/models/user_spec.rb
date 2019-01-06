require "rails_helper"

describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
  end
  describe "Relationships" do
    it {should have_many :favorites}
  end
  describe "instance methods" do
    it "can add favorites" do
      user = create(:user)
      result = user.add_favorites("denver,co")

      expect(result).to be_a(Favorite)
      expect(user.favorites.count).to eq(1)
    end
  end
end
