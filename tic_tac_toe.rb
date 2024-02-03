# Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

class Game
  attr_accessor :squares, :players

  def initialize
    @squares = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    ### For Testing
    # @squares = ["X", "O", " ", "X", " ", "O", " ", " ", " "] # 7 => [0,3,6]
    # @squares = ["X", "O", " ", "X", "X", "O", " ", "O", " "] # 9 => [0,4,8]
    # @squares = ["X", "X", "O", "O", "X", "X", " ", "O", "O "] # 7 => draw
    @players = [] 
    @combos = [
      [0, 1, 2], [0, 3, 6], [0, 4, 8],
      [1, 4, 7], [2, 5, 8], [2, 4, 6],
      [3, 4, 5], [6, 7, 8]
    ]

    self.request_player_info
  end

  def request_player_info
    2.times do
      puts "\n"
      puts "What is Player #{@players.length + 1}'s name?"
      name = gets.chomp.capitalize
      self.add_player(name)
    end
    puts "\n"
  end

  private def add_player(name)
    player = Player.new(name)

    @players << player
    player.number = @players.length

    player.game = self if player.initial = (player.number == 1 ? 'X' : 'O')
  end 

  def display_board
    puts "\n"
    puts "#{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
    puts '---------'
    puts "#{@squares[3]} | #{@squares[4]} | #{@squares[5]}"
    puts '---------'
    puts "#{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
    puts "\n"
  end

  def turns_taken 
    @squares.select { |square| square != " " }.length
  end

  def request_player_move(player)
    puts "#{player.name}, what square number do you pick?"
    selected_square_num = gets
    if selected_square_num.to_i >= 1 && selected_square_num.to_i <= 9
      player_moves(player, (selected_square_num.to_i - 1))
    else
      puts "You must chose a number between 1 and 9. Try again"
      request_player_move(player)
    end
  end

  def player_moves(player, sq_num)
    check_avail = check_sq_available(sq_num)

    if check_avail == true
      player_takes_square(player, sq_num)

      if self.check_if_winner(player.initial) == true
        puts "\n"
        puts "#{player.name} wins!"
        exit
      end

    else
      puts "\n"
      puts "Square #{sq_num + 1} is already taken. Please try again."
      request_player_move(player)
    end
  end

  def check_sq_available(sq_num)
    @squares[sq_num.to_i] == " "
  end

  def player_takes_square(player, sq)
    @squares[sq.to_i] = player.initial
    puts "#{player.name} takes square #{sq + 1}"

    if self.turns_taken == 9 
      puts "No more moves. It's a draw!"
      exit
    else
      self.display_board
    end
  end

  def check_if_winner(initial) 
    if squares.select { |init| init == initial.to_s }.count > 2
      chosen_squares = []
      squares.each_with_index { |item, index| 
        chosen_squares.push(index) if item == initial
      }

      chosen_squares.permutation(3).each do |combo|
        if @combos.include?(combo) 
          return true
        end
      end
    end
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
  g.request_player_move(player)
end
