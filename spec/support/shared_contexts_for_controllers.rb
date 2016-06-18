shared_examples 'an unauthenticated controller' do
  it 'redirects to sign in path' do
    expect(response).to redirect_to new_user_session_path
  end
  it 'sets alert flash message' do
    expect(flash[:alert]).to eq(I18n.t('devise.failure.unauthenticated'))
  end
end
