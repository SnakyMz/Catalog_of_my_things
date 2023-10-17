require_relative '../classes/genre'

describe Genre do
  describe '#initialize' do
    it 'creates a Genre instance' do
      genre = Genre.new('Drama')
      expect(genre).to be_instance_of Genre
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Drama')
      item = Item.new('2020-01-01')
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
