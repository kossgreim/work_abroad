require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'when has valid factory' do
    it 'creates a new client' do
      expect{create(:client)}.to change(Client, :count).by(1)
    end
  end
  context 'invalid when' do
    it 'has empty first name' do
      expect(build(:client, first_name: nil)).to be_invalid
    end
    it 'has empty last name' do
      expect(build(:client, last_name: nil)).to be_invalid
    end
    it 'has invalid email' do
      expect(build(:client, email: 'not email')).to be_invalid
    end
    it 'has empty phone' do
      expect(build(:client, phone: nil)).to be_invalid
    end
    it 'has empty phone' do
      expect(build(:client, phone: nil)).to be_invalid
    end
    context 'with more than 50 symbols' do
      let(:long_str){ Faker::Lorem.characters(51)}
      it 'first name' do
        expect(build(:client, first_name: long_str)).to be_invalid
      end
      it 'last name' do
        expect(build(:client, last_name: long_str)).to be_invalid
      end
      it 'phone' do
        expect(build(:client, phone: long_str)).to be_invalid
      end
      it 'email' do
        expect(build(:client, email: long_str)).to be_invalid
      end
    end
  end
end
