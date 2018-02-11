class Booking
    include DataMapper::Resource

    # a space can have many bookings
    belongs_to :space

    # User can request many bookings
    belongs_to :user

    property :id, Serial
    property :confirmed, Boolean
    property :start_date, Date, required: true
    property :end_date, Date, required: true
    property :comment, String, required: false

end
