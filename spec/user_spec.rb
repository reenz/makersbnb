feature 'sign up' do

  scenario 'user can list a new space' do
    expect { sign_up }.to change(User, :count).by(1)
  end

end
