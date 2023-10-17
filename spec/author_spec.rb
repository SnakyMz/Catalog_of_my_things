require_relative '../classes/author'

describe Author do
  context 'When testing Author class' do
    it 'Should be instance of the class' do
      author = Author.new('Soban', 'Syeed')
      expect(author).to be_instance_of(Author)
    end
  end
end
