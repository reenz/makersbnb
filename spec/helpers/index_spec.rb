feature 'Homepage' do
  scenario "when user clicks on sign up it takes you to the sign up page" do
    visit('/')
    click_button 'Sign up'
    expect(current_path).to eq('/signup')
  end

  scenario "when user clicks on log in it takes you to the log in page" do
    visit('/')
    click_button 'Log in'
    expect(current_path).to eq('/login')
  end

end
