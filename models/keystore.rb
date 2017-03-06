require 'data_mapper'
require 'dm-postgres-adapter'

class Keystore

  include DataMapper::Resource

  property :stored_key, String, :key => true
  property :stored_value, String

  def self.set_value key, value
    Keystore.create(stored_key: key, stored_value: value)
  end

  def self.get_value key
    Keystore.get(key).stored_value
  end
end

# This should be extracted out to an initializer
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/keystore_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
