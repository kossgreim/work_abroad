require 'rails_helper'

RSpec.describe User, :type => :model do

  context 'when valid' do
    let(:user) {build(:user)}
    it 'has valid factories' do
      expect(user).to be_valid
    end
  end

  context 'invalid when' do
    it 'has an empty first name' do
      expect(build(:user, first_name: nil)).to be_invalid
    end
    it 'has an empty last name' do
      expect(build(:user, last_name: nil)).to be_invalid
    end
    it 'has an empty email' do
      expect(build(:user, email: nil)).to be_invalid
    end
    it 'has an invalid email' do
      expect(build(:user, email: 'not really email')).to be_invalid
    end
    it 'first name has less than 2 symbols' do
      expect(build(:user, first_name: 'a')).to be_invalid
    end
    it 'last name has less than 2 symbols' do
      expect(build(:user, last_name: 'b')).to be_invalid
    end
    it 'first name has more than 30 symbols' do
      long_name = Faker::Lorem.characters(31)
      expect(build(:user, first_name: long_name))
    end
    it 'last name has more than 30 symbols' do
      long_name = Faker::Lorem.characters(31)
      expect(build(:user, last_name: long_name))
    end
  end

  describe '#full_name' do
    let(:user) { build(:user) }
    it 'joins up first and last name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
