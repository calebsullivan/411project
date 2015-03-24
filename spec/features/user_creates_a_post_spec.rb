# spec/features/user_creates_a_foobar_spec.rb

feature 'User creates a post' do
  scenario 'they see the link on the page' do
    visit index

    fill_in 'Post', with: 'I am an user'
    click_button 'Post'

    expect(page).to have_css '.foobar-name', 'My foobar'
  end
end