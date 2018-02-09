feature 'List space' do
  scenario 'user can see the form to list a space' do
    sign_up
    click_on 'List Space'
    expect(current_path).to eq('/spaces/new')
  end

  scenario 'user can see the form to list a space' do
    sign_up
    list_space
    expect(page).to have_content("Space name: Reena's house")
    expect(page).to have_content("100")
  end
end
