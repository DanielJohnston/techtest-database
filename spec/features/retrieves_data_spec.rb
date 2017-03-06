feature 'Retrieving data from the database' do
  scenario 'Using the appropriate URL' do
    store_an_item
    retrieve_an_item
    expect(page).to have_current_path('/get?key=somekey')
  end

  scenario 'That has previously been stored' do
    store_an_item
    retrieve_an_item
    expect(page).to have_content 'somevalue'
  end

  scenario 'As a different user' do
    store_an_item
    Capybara.reset_sessions!
    retrieve_an_item
    expect(page).to have_content 'somevalue'
  end
end
