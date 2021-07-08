class Game

  attr_accessor :pot_bet

  

	def initialize

    @pot_bet = 0   
	end

	def win_pot_bet(player)
		player.bank_player = player.bank_player + @pot_bet
  end

  def open_card(player)
    player.sum_of_points
  	player.cards_player
  end


  def diler_win(player)
    player.bank_player + @pot_bet
  end

  def hand_out_cards(player, card)
    card.stir_the_deck
    val = 2.times{ player.to_take_cards(card) }
  end

  def options
    puts "Введите 1, если хотите пропустить ход"
    puts "Введите 2, если хотите добавить карту"
    puts "Введите 3, если хотите открыть карты"
    gets.chomp
  end

  def option_one
    puts "Дилер сделал свой ход"
    user.skip(diler, card)
    puts
    game.options
  end

  def option_two
    user.add_card(diler, card)
    puts "Добавлена новая карта #{user.cards_player[-1]}"
  end
  
  def option_three
    game.open_card(user)
    game.open_card(diler)
    puts "Карты #{user.name} #{user.cards_player}"
    puts "Карты #{diler.name} #{diler.cards_player}"
  end

  def main_option(val)
    option = { "1" => -> { option_one },
               "2" => -> { option_two },
               '3' => -> { option_three } }
    option[val] 
  end 

  

end
















