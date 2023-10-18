require_relative 'classes/genre'
require_relative 'classes/music_album'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'modules/app_methods'
require_relative 'modules/input_taker'
require_relative 'user_input'
require 'securerandom'
require 'date'

# App class containing methods to perform application operations
class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  include InputTaker # join methods, they can take data for book and label classes
  # join the methods for label and book classes (insertion and listing)
  include Methods

  def run(option) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
    case option
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      puts 'Thank you for using the app. Goodbye!'
      exit
    else
      puts 'Invalid option'
    end
  end

  def add_music_album
    published_date = user_input('Input publish Date as YYYY-MM-DD: ')
    user_input('Is music album archvied? [Y/N]: ')
    user_input('Is music album on spotify? [Y/N]: ')
    album = MusicAlbum.new(published_date, archived: true, on_spotify: true)
    @music_albums.push(album)
    genre = user_input('Input music album genre: ')
    @genres.push(Genre.new(genre))
    puts 'Music album added successfully!'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums found!'
    else
      puts 'Music albums:'
      @music_albums.each.with_index do |music_album, index|
        puts "#{index + 1}) publish_date: #{music_album.published_date}, id: #{music_album.id}, archived:
      #{music_album.archived}, on_spotify: #{music_album.on_spotify}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No music album genres found!'
    else
      puts 'Music album genres:'
      @genres.each.with_index do |genre, index|
        puts "#{index + 1}) id: #{genre.id}, name: #{genre.name}"
      end
    end
  end

  def list_games
    puts 'No games in the library!' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index + 1} | #{game.label.title} | Last Played: #{game.last_played_at}"
    end
  end

  def list_authors
    puts 'No authors in the library' if @authors.empty?
    @authors.each_with_index do |author, index|
      puts "#{index + 1} | #{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    genre = Genre.new(user_input("Enter game's Genre: "))
    label = Label.new(user_input('Enter game Title/label: '), SecureRandom.hex(3))
    puts "Enter game's Director/Author"
    first_name = user_input('First name: ')
    last_name = user_input('Last name: ')
    author = Author.new(first_name, last_name)
    multiplayer = user_input('Does the game has multiplayer option[true/false]: ')
    last_played_at = user_input('Last played[yyyy-mm-dd]: ')
    published_date = user_input('Release date[yyyy-mm-dd]: ')
    game = Game.new(multiplayer, last_played_at, published_date)
    genre.add_item(game)
    label.add_item(game)
    author.add_item(game)
    @games << game
    @genres << genre
    @labels << label
    @authors << author
    puts 'Game added successfully'
  end
end
