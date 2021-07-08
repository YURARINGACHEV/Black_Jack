require_relative 'player'
require_relative 'deck_of_cards'
require_relative 'game'
require_relative 'user'
require_relative 'diler'

puts 'Введите ваше имя '
user = User.new(gets.chomp)
diler = Diler.new('diler')
card = DeckOfCards.new
card.deck_of_card
game = Game.new

loop do
  game.begin_game(user) if card.cards.length == 16

  card.stir_the_deck

  game.hand_out_cards(user, card)
  game.hand_out_cards(diler, card)

  puts "diler #{diler.cards_player}"
  puts "user #{user.cards_player}"
  puts 'Сделана ставка в 20 долларов'

  game.pot_bet = 20

  user.bank_after_bet
  diler.bank_after_bet

  puts "У вас на счету #{user.bank_player} доларов"
  puts "У дилеру на счету #{diler.bank_player} доларов"
  puts

  diler.sum_of_points

  puts "Ваши карты #{user.cards_player}"
  puts 'Карты дилера * *'
  puts
  puts "Сумма ваших очков #{user.sum_of_points}"
  puts

  game.main_option(game.options, user, diler, card)

  user.sum_of_points
  diler.sum_of_points

  puts "Ваши карты #{user.cards_player}"
  puts "Карты дилера #{diler.cards_player}"
  puts "Сумма ваших очков #{user.points}"
  puts "Сумма очков дилера #{diler.points}"

  if diler.points == user.points
    puts 'Ничья'
    diler.bank_after_draw
    user.bank_after_draw
    puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    puts "Счет в банке #{user.name} равен #{user.bank_player}"
  elsif user.points > 21
    puts "Эту раздачу выиграл #{diler.name}, у #{user.name} сумма очков больше 21"
    diler.bank_after_win(game)
    puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    puts "Счет в банке #{user.name} равен #{user.bank_player}"
  elsif user.points <= 21
    if diler.points > user.points && diler.points <= 21
      diler.bank_after_win(game)
      puts "Эту раздачу выиграл #{diler.name}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
    elsif diler.points < user.points
      user.bank_after_win(game)
      puts "Эту раздачу выиграл #{user.name}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    elsif diler.points > 21
      user.bank_after_win(game)
      puts "Эту раздачу выиграл #{user.name}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    end
  end

  user.cards_player = []
  diler.cards_player = []
  game.game_over(user, card)
  game.game_over(diler, card)
  game.empty_deck(card)
  puts
  puts 'Введите ноль, если хотите закончить игру'
  puts 'Нажмите enter, если хотите продолжить'
  exit if gets.chomp == '0'
end
