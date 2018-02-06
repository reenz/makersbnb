module Helpers

  def sign_up(username: 'reenz', email: 'reenz@test.com', password: 'password')
    visit('/')
    fill_in :username,  with: username
    fill_in :email,  with: email
    fill_in :password,  with: password
    click_button 'Sign up'
 end

 def list_space(space_name: 'Reena\'s house',
    space_description: 'Lovely house with very nice garden',
    space_price: '£100', space_availability: '11.02.2018 - 15.02.2018')
   sign_up
   click_button 'List a Space'
   fill_in :space_name,  with: space_name
   fill_in :space_description,  with: space_description
   fill_in :space_price,  with: space_price
   fill_in :space_availability,  with: space_availability
   click_button 'List my Space'
 end 

end
