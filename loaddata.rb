require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/music_album'
require_relative 'classes/game'
require 'json'

def loadgenre
  genres = []
  return genres if File.empty?('json/genre.json')

  genresdata = File.read('json/genre.json')
  genresarray = JSON.parse(genresdata)
  genresarray.each do |genre|
    genres << Genre.new(genre['name'])
  end
  genres
end

def loadlabel
  labels = []
  return labels if File.empty?('json/label.json')

  labelsdata = File.read('json/label.json')
  labelsarray = JSON.parse(labelsdata)
  labelsarray.each do |label|
    labels << Label.new(label['title'], label['color'])
  end
  labels
end

def loadauthor
  authors = []
  return authors if File.empty?('json/author.json')

  authorsdata = File.read('json/author.json')
  authorsarray = JSON.parse(authorsdata)
  authorsarray.each do |author|
    authors << Author.new(author['first_name'], author['last_name'])
  end
  authors
end

def loadbook
  books = []
  return books if File.empty?('json/book.json')

  booksdata = File.read('json/book.json')
  booksarray = JSON.parse(booksdata)
  booksarray.each do |book|
    newbook = Book.new(book['publisher'], book['cover_state'], book['published_date'])
    genre = Genre.new(book['genre'])
    newbook.genre = genre
    books << newbook
  end
  books
end

def loadmusic
  musics = []
  return musics if File.empty?('json/music.json')

  musicsdata = File.read('json/music.json')
  musicsarray = JSON.parse(musicsdata)
  musicsarray.each do |music|
    music_album = MusicAlbum.new(music['published_date'], on_spotify: music['on_spotify'])
    genre = Genre.new(music['genre'])
    label = Label.new(music['title'], music['color'])
    author = Author.new(music['first_name'], music['last_name'])
    music_album.genre = genre
    music_album.label = label
    music_album.author = author
    musics << music_album
  end
  musics
end

def loadgame
  games = []
  return games if File.empty?('json/game.json')

  gamesdata = File.read('json/game.json')
  gamesarray = JSON.parse(gamesdata)
  gamesarray.each do |game|
    newgame = Game.new(game['multiplayer'], game['last_played_at'], game['published_date'])
    genre = Genre.new(game['genre'])
    label = Label.new(game['title'], game['color'])
    author = Author.new(game['first_name'], game['last_name'])
    newgame.genre = genre
    newgame.label = label
    newgame.author = author
    games << newgame
  end
  games
end
