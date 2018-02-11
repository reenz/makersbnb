
feature 'Booking' do
    scenario 'user can book a space' do
        sign_up
        list_space
        click_button 'Book here'
        fill_in :availability_start,  with: "11-02-2015"
        fill_in :availability_end,  with: "12-02-2015"
        p "HELLO"
        expect { click_button 'Request to book'; p page.body }.to change(Booking, :count).by(1)
    end
end
