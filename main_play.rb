require_relative 'player'
require_relative 'deck_of_cards'
require_relative 'game'
require_relative 'user'
require_relative 'diler'
require_relative 'card'
require_relative 'hand'
require_relative 'hand_user'
require_relative 'hand_diler'
require_relative 'interface'
require_relative 'bank'
require_relative 'bank_user'
require_relative 'bank_diler'
require_relative 'black_jack'

loop do
  puts 'нажмите enter если хотите играть'
  puts 'Нажмите 0, если хотите выйти с игры'
  exit if gets.chomp == '0'
  black_jack = BlackJack.new
end
