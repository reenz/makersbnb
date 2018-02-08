feature 'log out' do
  before(:each) do
    User.create(username:  'sam_maker',
      email: 'sam@yahoo.com',
       password: '123' )
  end

  scenario 'users can sign out' do
    log_in
    click_button 'log out'
    expect(page).to have_content("goodbye")
  end
end
