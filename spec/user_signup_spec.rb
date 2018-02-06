feature 'Sign_up' do
  scenario "user can visit homepage" do
    visit('/')

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Hello!")
  end

  scenario "user can sign_up with their personal details" do
    visit('/')
    fill_in :username,  with: "reenz"
    fill_in :email,  with: "reenz@test.com"
    fill_in :password,  with: "password"
    click_button 'Sign up'
    expect(page.status_code).to eq(200)
  end

end
