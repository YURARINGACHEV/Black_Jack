require_relative 'player'
require_relative 'deck_of_cards'
require_relative 'game'
require_relative 'user'
require_relative 'diler'


puts "Введите ваше имя "
user = User.new(gets.chomp)
diler = Diler.new("diler")
card = DeckOfCards.new
card.deck_of_card
card.deck_of_card
game = Game.new
puts
puts "Приветствую #{user.name}. Предлогаю сыграть в Black Jack с компьютером(diler)"
puts "У вас и у дилера в банке по 100 долларов"
puts "Ставка с игрока равна 10 долларов"
puts
puts "Если хотите сыграть нажмите enter"
puts "Если хотите выйти нажмите 0"
exit if gets.chomp == '0'

loop do  
  game.hand_out_cards(user, card)
  game.hand_out_cards(diler, card)
  
  puts "Сделана ставка в 20 долларов"
  puts "В банке сейчас #{game.pot_bet = 20}"
  user.bank_after_bet
  diler.bank_after_bet
  puts "У вас на счету #{user.bank_player} доларов"
  puts "У дилеру на счету #{diler.bank_player} доларов"
  puts
  diler.sum_of_points
  puts "Ваши карты #{user.cards_player}"
  puts "Карты дилера * *"
  puts
  puts "Сумма ваших очков #{user.sum_of_points}"
  puts

  game.main_option(game.options)
# def hash_second_menu(val)
#     menus = { 0 => -> { choice_main_menu },
#               1 => -> { @rail_road.create_train_to_station },
#               2 => -> { @rail_road.show_station_train },
#               3 => -> { @rail_road.show_train_wagon },
#               4 => -> { @rail_road.show_station },
#               5 => -> { @rail_road.show_train } }
#     (menus[val] || choice_actions_objects).call
#     choice_actions_objects
#   end

#   case game.options
#   when '1'
#   	puts "Дилер сделал свой ход"
#     user.skip(diler, card)
#     puts
#     game.options

#   when "2"
#   	user.add_card(diler, card)
#     puts "Добавлена новая карта #{user.cards_player[-1]}"
#   when "3"
#     game.open_card(user)
#     game.open_card(diler)
  	
#   	puts "Карты #{user.name} #{user.cards_player}"
#     puts "Карты #{diler.name} #{diler.cards_player}"
  	
#   end

  diler.add_skip_diler(card)
  user.sum_of_points
  diler.sum_of_points
  puts "Ваши карты #{user.cards_player}"
  puts "Карты дилера #{diler.cards_player}"
  puts "Сумма ваших очков #{user.points}"
  puts "Сумма очков дилера #{diler.points}"

  if user.points > 21
    puts "Эту раздачу выиграл #{diler.name}, у #{user.name} сумма очков больше 21"
    diler.bank_after_win(game)
    puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    puts "Счет в банке #{user.name} равен #{user.bank_player}"

  elsif user.points <= 21 && diler.points <= 21
    if diler.points > user.points
      diler.bank_after_win(game)
      puts "Эту раздачу выиграл #{diler.name}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player + game.pot_bet}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
    elsif diler.points < user.points
      user.bank_after_win(game)
      puts "Эту раздачу выиграл #{user.name}"
      puts "Счет в банке #{user.name} равен #{user.bank_player + game.pot_bet}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    else 
      puts "Ничья"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player + game.pot_bet/2}"
      puts "Счет в банке #{user.name} равен #{user.bank_player/2}"
    end
  elsif user.points >= 21 && diler.points >= 21
    if diler.points < user.points
      puts "Эту раздачу выиграл #{diler.name}"
      diler.bank_after_win(game)
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
    elsif diler.points > user.points
      user.bank_after_win(game)
      puts "Эту раздачу выиграл #{user.name}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    else 
      puts "Ничья"
      diler.bank_after_draw(game)
      user.bank_after_draw(game)
      puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
      puts "Счет в банке #{user.name} равен #{user.bank_player}"
    
    end
  elsif diler.points == user.points
    puts "Ничья"
    diler.bank_after_draw(game)
    user.bank_after_draw(game)
    puts "Счет в банке #{diler.name} равен #{diler.bank_player}"
    puts "Счет в банке #{user.name} равен #{user.bank_player}"
 
  end
  user.cards_player = []
  diler.cards_player = []
  puts "Введите ноль если хотите выйти"
  exit if card.cards.length < 6
  exit if gets.chomp == '0'
end
