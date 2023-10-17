require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'modules/app_methods'
require_relative 'modules/input_taker'
require_relative 'user_input'
require 'securerandom'

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

  def list_games
    puts 'No games in the library' if @games.empty?
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
