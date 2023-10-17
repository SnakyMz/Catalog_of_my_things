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
end