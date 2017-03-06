feature 'Retrieving data from the database' do
  scenario 'Using the appropriate URL' do
    store_an_item
    retrieve_an_item
    expect(page).to have_current_path('/get?key=somekey')
  end
end
