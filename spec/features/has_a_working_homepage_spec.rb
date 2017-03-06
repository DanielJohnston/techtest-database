feature 'The home page' do
  scenario 'Can show page content' do
    visit('/')
    expect(page).to have_content 'Hello user'
  end
end
