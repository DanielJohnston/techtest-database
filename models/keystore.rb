# Note that this uses class instance variables, pending use of an actual persistence layer
class Keystore
  def self.create
    @keystore = Keystore.new
  end

  def self.instance
    @keystore
  end

  def initialize
    @values = Hash.new
  end

  def set_value key, value
    @values[key] = value
  end

  def get_value key
    @values[key]
  end
end
