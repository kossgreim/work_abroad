require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  describe "GET index" do
    context 'when user signed in' do
      before do
        get :index
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'renders :index template' do
        expect(response).to render_template :index
      end
    end
  end

end
