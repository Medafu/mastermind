# frozen_string_literal: false

# Game class containing all methods for "Mastermind" game
class Game
  def initialize
    puts 'Choose whether you want to be code MAKER or code BREAKER'
    puts '1. Breaker'
    puts '2. Maker'
    choice = gets.chomp
    case choice
    when "1"
      breaker
    when "2"
      maker
    else
      'Wrong input.'
    end
  end

  private

  def maker; end

  def breaker
    puts 'Code Breaker. Enter 4 numbers together from 1 to 6 to start guessing.'
    #@generated = 4.times.map { rand(1..6).to_s }
    @generated = ["2", "5", "4", "4"]
    p @generated
    @input = gets.chomp.split('')
    @input = gets.chomp.split('') until input_check && broke?
    puts 'You Win!'
  end

  def input_check
    if @input.length == 4 && @input.all? { |el| el.to_i != 0 && el.length == 1 && (el.to_i >= 1 && el.to_i <= 6) }
      true
    else
      puts 'Wrong input.'
      false
    end
  end

  def broke?
    true if @input == @generated

    result = counting
    draw_result(result[0], result[1])
    result[0] == 4
  end

  def counting
    full = 0
    half = 0
    temp_gen = @generated.dup
    temp_gen.each_with_index do |i_val, i|
      if i_val == @input[i]
        full += 1
        temp_gen[i] = "*"
        @input[i] = "*"
      end
    end

    @input.each do |e|
      next unless e != "*" && temp_gen.include?(e)

      half += 1
      temp_gen[temp_gen.index(e)] = "*"
    end
    [full, half]
  end

  def draw_result(full, half)
    full.times { print "\u{25CF} " }
    half.times { print "\u{25CB} " }
    puts
  end
end

Game.new
