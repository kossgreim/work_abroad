require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#replace_flash_key' do
    it 'replaces :alert into "danger"' do
      expect(helper.replace_flash_key(:alert)).to eq('danger')
    end
    it 'replaces "alert" into "danger"' do
      expect(helper.replace_flash_key(:alert)).to eq('danger')
    end
    it 'replaces :notice into "info"' do
      expect(helper.replace_flash_key(:notice)).to eq('info')
    end
    it 'replaces "notice" into "info"' do
      expect(helper.replace_flash_key(:notice)).to eq('info')
    end
    context 'when arg. "key" is not in the list' do
      it 'returns value of "key"' do
        expect(helper.replace_flash_key('hello')).to eq('hello')
      end
    end
  end

  describe '#user_assigned_roles' do
    let(:user) {create(:user)}
    before do
      [:admin, :manager].each do |role|
        create(:role, name: role)
        user.add_role role
      end
      sign_in user
    end
    it 'joins up all user roles in a string' do
      expect(helper.user_assigned_roles).to eq('admin, manager')
    end
    it 'seperates roles by comma' do
      expect(helper.user_assigned_roles).to include(',')
    end
  end
end
