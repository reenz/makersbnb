class Space

  include DataMapper::Resource

  # A user can own many spaces
  # belongs_to :space_owner, User, child_key: ["space_owner_id"]
  belongs_to :user

  # A space can have many bookings against it
  has n, :bookings, :model => "Booking"

  property :id, Serial
  property :space_name, String, required: true
  property :space_description, Text, required: true
  property :address, String, required: true
  property :space_price, String, required: true
  property :availability_start, Date, required: true
  property :availability_end, Date, required: true

  def unavailable?(requested_start, requested_end)
    requested_start < availability_start or requested_end > availability_end
  end

  def booked?(requested_start, requested_end)
    bookings.any? { |book|
      dt_range = book.start_date..book.end_date
      book.confirmed and (dt_range.include?(requested_start) or dt_range.include?(requested_end))
    }
  end

end
