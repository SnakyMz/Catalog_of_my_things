# Class containing data about author
class Author
  def initialize(first_name, last_name)
    @id = rand(1..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end