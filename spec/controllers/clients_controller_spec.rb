require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET index" do
    context 'when user is signed in' do
      before do
        sign_in user
        get :index
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'renders :index view' do
        expect(response).to render_template(:index)
      end
      it 'populates an array of users' do
        clients = create_list(:client, 5)
        clients.push create(:client)
        clients.sort_by! {|u| u.id }
        expect(assigns(:clients)).to eq(clients)
      end
    end
    context 'when user is not signed in' do
      before do
        get :index
      end
      include_examples 'an unauthenticated controller'
    end
  end

  describe "GET show" do
    let(:client) {create(:client)}
    context 'when users is signed in' do
      before do
        sign_in user
        get :show, params: { id: client.id }
      end
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders :show view' do
        expect(response).to render_template(:show)
      end
      it 'assigns requested client to @client' do
        expect(assigns(:client)).to eq(client)
      end
    end
    context 'when users is not signed in' do
      before do
        get :show, params: { id: client.id }
      end
      include_examples 'an unauthenticated controller'
    end
  end

  describe "GET new" do
    context 'whne user is signed in' do
      before do
        sign_in user
        get :new
      end
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'assigns a new client to @client' do
        expect(assigns(:client)).to be_a_new(Client)
      end
      it 'renders :new template' do
        expect(response).to render_template(:new)
      end
    end
    context 'when users is not signed in' do
      before do
        get :new
      end
      include_examples 'an unauthenticated controller'
    end
  end
end
