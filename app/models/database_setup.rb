require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'
require_relative 'space'
require_relative 'booking'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
