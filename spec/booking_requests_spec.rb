feature 'Booking request' do
  scenario 'user can request a booking from the list of spaces' do
    sign_up
    list_space
    click_button "Reena's house"
    expect(page).to have_content("Space name: Reena's house")
    expect(page).to have_content("Lovely house with very nice garden")
    expect(page).to have_content("£100")
    expect(page).to have_content("11.02.2018 - 15.02.2018")
  end
end
