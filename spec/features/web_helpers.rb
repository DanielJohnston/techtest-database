def store_an_item
  visit '/'
  fill_in 'Key to set', with: 'somekey'
  fill_in 'Value to store', with: 'somevalue'
  click_button 'Store this'
end

def retrieve_an_item
  visit '/'
  fill_in 'Key to retrieve', with: 'somekey'
  click_button 'Retrieve this'
end
