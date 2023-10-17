class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = rand(1...300)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  # class in hash form
  def serialize
    {
      'title' => @title,
      'color' => @color
    }.to_json
  end

  # convert hash to class
  def self.de_serialize(data)
    new(data['title'], data['color'])
  end
end
