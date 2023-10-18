require 'json'

def store_genre(class_genre)
  genres = []
  class_genre.each do |genre|
    genres << { name: genre.name }
  end
  genre_json = JSON.generate(genres)
  File.write('json/genre.json', genre_json)
end

def store_label(class_label)
  labels = []
  class_label.each do |label|
    labels << { title: label.title, color: label.color }
  end
  label_json = JSON.generate(labels)
  File.write('json/label.json', label_json)
end

def store_author(class_author)
  authors = []
  class_author.each do |author|
    authors << { first_name: author.first_name, last_name: author.last_name }
  end
  author_json = JSON.generate(authors)
  File.write('json/author.json', author_json)
end

def store_books(class_book)
  books = []
  class_book.each do |book|
    books << { publisher: book.publisher,
               cover_state: book.cover_state,
               published_date: book.published_date,
               genre: book.genre.name }
  end
  book_json = JSON.generate(books)
  File.write('json/book.json', book_json)
end

def store_musics(class_music)
  musics = []
  class_music.each do |music|
    musics << { published_date: music.published_date,
                on_spotify: music.on_spotify,
                genre: music.genre.name,
                title: music.label.title,
                color: music.label.color,
                first_name: music.author.first_name,
                last_name: music.author.last_name }
  end
  music_json = JSON.generate(musics)
  File.write('json/music.json', music_json)
end

def store_games(class_game)
  games = []
  class_game.each do |game|
    games << { multiplayer: game.multiplayer,
               last_played_at: game.last_played_at,
               published_date: game.published_date,
               genre: game.genre.name,
               title: game.label.title,
               color: game.label.color,
               first_name: game.author.first_name,
               last_name: game.author.last_name }
  end
  game_json = JSON.generate(games)
  File.write('json/game.json', game_json)
end
