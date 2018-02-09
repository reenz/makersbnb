feature 'Sign_up' do
  scenario "user can visit homepage" do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content("sign-up")
  end

  scenario "user can sign_up with their personal details" do
    sign_up
    expect(page.status_code).to eq(200)
  end

  scenario "user name displayed on the bnb list page after sign up" do
    sign_up
    expect(page).to have_content("Welcome reenz")
  end
end
