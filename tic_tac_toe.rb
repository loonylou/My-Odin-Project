# Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

# Issues - same initial twice?

class Game
  attr_accessor :squares, :win_tracker, :players

  def initialize
    @squares = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @players = []
    @winning_combos = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]

    request_player_info
  end

  def request_player_info
    2.times do
      puts "\n"
      puts "What is Player #{@players.length + 1}'s name?"
      name = gets.chomp.capitalize
      add_player(name)
    end

    puts "\n"
  end

  def add_player(name)
    player = Player.new(name)
    @players << player
    player.number = @players.length

    player.game = self if player.initial = (player.number == 1 ? 'X' : 'O')

    def display_board
      puts "\n"
      puts "#{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
      puts '---------'
      puts "#{@squares[3]} | #{@squares[4]} | #{@squares[5]}"
      puts '---------'
      puts "#{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
      puts "\n"
    end

    def request_player_move(player)
      puts "#{player.name}, what square number do you pick?"
      selected_square_num = gets
      player_moves(player, (selected_square_num.to_i - 1))
    end

    def player_moves(player, sq_num)
      check_avail = check_sq_available(sq_num)

      if check_avail == true
        player_takes_square(player, sq_num)
      else
        puts "\n"
        puts "Square #{sq_num + 1} is already taken. Please try again."
        request_player_move(player)
      end

      display_board
    end

    def check_sq_available(sq_num)
      @squares[sq_num.to_i] == ' '
    end

    def player_takes_square(player, sq)
      @squares[sq.to_i] = player.initial
      puts "#{player.name} chooses square #{sq + 1}"
    end
  end

  # CLASS: PLAYER
  class Player
    attr_accessor :name, :initial, :number, :game

    @@all = []

    def initialize(name)
      @name = name
      @@all << self
    end

    def self
      @@all
    end
  end

  # Set up
  puts 'Welcome to Tic-Tac-Toe!'
  g = Game.new

  # Intro
  g.players.each_with_index do |player, index|
    puts "Player #{index + 1} is #{player.name}, using #{player.initial}."
  end
  puts g.display_board

  # Play
  g.players.each do |player|
    1.times do
      g.request_player_move(player)
    end
  end
end
