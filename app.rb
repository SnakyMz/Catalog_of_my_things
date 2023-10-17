require_relative 'modules/app_methods'
require_relative 'modules/input_taker'
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

  # ##################
  # adding the modules
  ####################

  include InputTaker # join methods, they can take data for book and label classes
  # join the methods for label and book classes (insertion and listing)
  include Methods

  # ##################
  # modules added
  ####################

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
      add_label
    else
      puts 'Invalid option'
    end
  end
end
