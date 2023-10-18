require './classes/book'

describe Book do
  # 2 instance for Book
  book1 = Book.new('publisher', 'good', '2011-3-11')
  book2 = Book.new('publisher', 'bad', '2023-2-5')

  # test methods
  context 'Test for method: can_be_archived' do
    it 'should return true, parent => true' do
      expect(book1.can_be_archived?).to be true
    end

    it 'should return true, cover_state => bad' do
      expect(book2.can_be_archived?).to be true
    end
  end
end