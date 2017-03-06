require './models/keystore'
describe Keystore do
  it '#set_value' do
    expect{ Keystore.set_value('somekey', 'somevalue') }.not_to raise_error
  end

  it '#get_value' do
    Keystore.set_value('somekey', 'somevalue')
    expect(Keystore.get_value('somekey')).to eq 'somevalue'
  end
end
