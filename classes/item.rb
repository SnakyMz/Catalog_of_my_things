require 'date'

class Item
  attr_accessor :label, :id, :published_date
  attr_reader :archived, :author, :genre

  def initialize(published_date, archived: false)
    @id = rand(1...100)
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  # should change the archived value to true
  # if the result of the can_be_archived?() method is true
  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private

  # return true/false if published_date is older than 10 years.
  def can_be_archived?
    (Date.today.year - @published_date.year).to_i > 10
  end
end
