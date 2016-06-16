require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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
        users = create_list(:user, 5)
        users.push user
        users.sort_by! {|u| u.id }
        expect(assigns(:users)).to eq(users)
      end
    end
    context 'when user is not signed in' do
      before do
        get :index
      end
      it 'redirects to sign in path' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET show" do
    context 'when user signed in' do
      before do
        sign_in user
        get :show, params: {id: user.id}
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'renders :show view' do
        expect(response).to render_template(:show)
      end
      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq(user)
      end
    end
    context 'when user is not signed in' do
      before do
        get :show, params: {id: user}
      end
      it 'redirects to the sign in path' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "GET new" do
    context 'when user signed in' do
      before do
        sign_in user
        get :new
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'renders :new view' do
        expect(response).to render_template :new
      end
      it 'assigns a new User to @user' do
        expect(assigns(:user)).to be_a(User)
      end
    end
  end

  describe "POST create" do
    before do
      sign_in user
    end
    context 'with valid attributes' do
      it 'creates a new User' do
        expect{
            post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end
      it 'sets successful flash message' do
        post :create, params: {user: attributes_for(:user)}
        expect(flash[:notice]).to eq(I18n.t('messages.user.created'))
      end
    end
    context 'with invalid attributes' do
      it 'does not create a new User' do
        expect{
            post :create, params: {user: attributes_for(:user, email: nil)}
        }.to change(User, :count).by(0)
      end
      it 'renders :new view' do
        post :create, params: {user: attributes_for(:user)}
      end
    end
  end

  describe "GET edit" do
    context 'when user is signed in' do
      let(:edited_user) {create(:user)}
      before do
        sign_in user
        get :edit, params: {id: edited_user}
      end
      it { is_expected.to render_template :edit }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'assigns the requested User to @user' do
        expect(assigns(:user)).to eq(edited_user)
      end
    end
  end

  describe "GET update" do
    let(:updated_user) {create(:user)}

    context 'with valid attributes' do
      before do
        sign_in user
        patch :update, parmas: {id: updated_user}
      end
      it 'assigns requested User to @user'
      it 'updates user attributes'
      it 'redirects to user preview page'
    end
    context 'with invalid attributes' do
      it 'does not update attributes'
      it 're-renders :edit view'
    end
  end

  describe "GET destroy" do
    xit "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
