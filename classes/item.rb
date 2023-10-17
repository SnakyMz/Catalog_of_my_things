require 'date'

class Item
  attr_accessor :author, :label, :genre, :published_date
  attr_reader :archived

  def initialize(published_date, archived: false)
    @id = rand(1...100)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  # should change the archived property to true
  # if the result of the can_be_archived?() method is true
  def move_to_archive
    @archived = true if can_be_archived?
  end
  # return true if published_date is older than 10 years.
  def can_be_archived?
    (Date.today.year - @published_date.year).to_i > 10
  end
end