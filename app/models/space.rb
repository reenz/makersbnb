class Space
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :space_name, String, required: true
  property :space_description, Text, required: true
  property :space_price, String, required: true
  property :availability_start, String, required: true
  property :availability_end, String, required: true

end
