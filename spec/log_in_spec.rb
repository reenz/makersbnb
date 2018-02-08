feature 'Log in' do

  let!(:user) do
    User.create(username:  'sam_maker',
      email: 'sam@yahoo.com',
       password: '123' )
  end

  scenario 'User can log in' do
    log_in
    expect(page).to have_content("Welcome sam_maker")
  end

end
