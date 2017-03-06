feature 'The home page' do
  scenario 'Can show page content' do
    visit('/')
    expect(page).to have_content 'Hello user'
  end

  scenario 'Shows a form to store my stuff' do
    visit('/')
    fill_in 'Key to set', with: 'somekey'
    fill_in 'Value to store', with: 'somevalue'
    expect{ click_button 'Store this' }.not_to raise_error
  end
end
