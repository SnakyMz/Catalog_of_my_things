require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :published_date

  def initialize(publisher, cover_state, published_date)
    super(published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  # true if parent's method returns true
  # true if cover_state == "bad"
  def can_be_archived?
    super || @cover_state == 'bad'
  end

  # object face of the class
  def serialize
    {
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'published_date' => @published_date
    }.to_json
  end

  # convert json hash data to class of book
  def self.de_serialize(data)
    new(
      data['publisher'],
      data['cover_state'],
      data['published_date']
    )
  end
end
