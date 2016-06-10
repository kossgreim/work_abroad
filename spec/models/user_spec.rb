require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#full_name' do
    let(:user) { build(:user) }
    it 'joins up first and last name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
