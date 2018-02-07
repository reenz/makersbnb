class Space
  include DataMapper::Resource

  belongs_to :user

  property :space_name, String
  property :space_description, Text
  property :space_price, Integer
  property :availability_start, Date
  property :availability_end, Date

end
