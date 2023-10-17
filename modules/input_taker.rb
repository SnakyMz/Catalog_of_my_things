module InputTaker
  def book_inputs
    print 'publisher: '
    publisher = gets.chomp.to_s
    print 'cover_state: '
    cover_state = gets.chomp.to_s.downcase
    print 'published_date(YYYY-MM-DD): '
    published_date = gets.chomp.to_s
    [publisher, cover_state, published_date]
  end

  def label_inputs
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    [title, color]
  end
end
