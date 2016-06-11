require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  describe "GET index" do
    let(:user) {create(:user)}
    context 'when user is signed in' do
      before do
        sign_in user
        get :index
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'renders :index template' do
        expect(response).to render_template :index
      end
    end

    context 'when user is not signed in' do
      before do
        get :index
      end
      it "redirects to sign in page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
