feature 'Sign_up' do
  scenario "user can sign_up" do
    visit('/')
    expect(page.status_code).to eq(200)
  end

end
