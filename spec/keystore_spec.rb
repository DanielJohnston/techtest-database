require './models/keystore'
describe Keystore do
  it '#set_value' do
    expect{ subject.set_value('somekey', 'somevalue') }.not_to raise_error
  end

  it '#get_value' do
    subject.set_value('somekey', 'somevalue')
    expect(subject.get_value('somekey')).to eq 'somevalue'
  end
end
