feature 'The home page' do
  scenario 'Can show page content' do
    visit('/')
    expect(page).to have_content 'Hello user'
  end

  scenario 'Shows a form to store my stuff' do
    # Is raising an expect on a helper method good practice?
    expect{ store_an_item }.not_to raise_error
  end
end
