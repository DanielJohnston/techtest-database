feature 'Storing data in the database' do
  scenario 'Acknowledging webpage submission' do
    store_an_item
    expect(page).to have_content 'Your item has been stored'
  end

  scenario 'Using the appropriate URL' do
    store_an_item
    expect(page).to have_current_path('/set?somekey=somevalue')
  end
end
