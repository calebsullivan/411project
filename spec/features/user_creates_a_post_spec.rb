# spec/features/user_creates_a_post_spec.rb

feature 'User creates a post' do
  scenario 'User wants to post using quick post box on dashboard.' do
    visit index

    fill_in 'Post', with: 'I am an user and this is a post.'
    click_button 'Submit'

    expect(page).to have_css '.site', 'The css for the page did indeed load!'
  end
end