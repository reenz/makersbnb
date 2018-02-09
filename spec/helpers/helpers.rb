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

    space_price: '100', availability_start: "11-02-2015", availability_end: '15-02-2015')

   click_on 'List Space'
   fill_in :space_name,  with: space_name
   fill_in :space_description,  with: space_description
   fill_in :space_price,  with: space_price
   fill_in :availability_start,  with: availability_start
   fill_in :availability_end,  with: availability_end
   click_button 'List my Space'
 end

 def log_in(email: 'sam@yahoo.com', password: '123')
   visit('/')
   click_button 'login'
   fill_in :email,  with: email
   fill_in :password,  with: password
   click_button 'submit'
 end
end
