feature 'User sign in' do

 let(:user) do
   User.create(username: 'katsuraku',
               name: 'name',
               email: 'user@example.com',
               password: 'secret1234',
               password_confirmation: 'secret1234')
 end

 scenario 'with correct credentials' do
   sign_in(username: user.username,   password: user.password)
   click_button 'Sign in'
   expect(page).to have_content "Welcome, #{user.username}"
 end

  def sign_in(username:, password:)
   visit '/sessions/new'
   fill_in :username, with: user.username
   fill_in :password, with: user.password
  end
  
end