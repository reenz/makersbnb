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

  scenario 'User has error when given the wrong email or password' do
    log_in(email: 'sam@yahoo.co.uk', password: '123')
    expect(page).to have_content("The email or password is incorrect")
  end

end
