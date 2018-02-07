feature 'list a space' do

  scenario 'user can list a new space' do
    sign_up
    expect { list_space }.to change(Space, :count).by(1)
  end

end
