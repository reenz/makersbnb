feature 'List space' do
  scenario 'user can see the form to list a space' do
    sign_up
    list_space
    expect(current_path).to eq('/spaces')
  end

  scenario 'user can see the form to list a space' do
    sign_up
    list_space
    expect(page).to have_content("Space name: Reena's house")
    expect(page).to have_content("Lovely house with very nice garden")
    expect(page).to have_content("£100")
    expect(page).to have_content("11.02.2018 - 15.02.2018")
  end
end
