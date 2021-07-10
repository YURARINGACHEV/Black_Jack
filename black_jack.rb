class BlackJack
  def initialize
    bank_user = BankUser.new
    bank_diler = BankDiler.new
    deck = DeckOfCards.new
    deck.deck_of_card
    deck.stir_the_deck
    puts 'Введите имя'
    user = User.new(gets.chomp)
    diler = Diler.new('diler')
    hand_user = HandUser.new
    hand_diler = HandDiler.new
    interface = Interface.new
    game = Game.new(hand_user, hand_diler, user, diler,
                    deck, interface, bank_diler, bank_user)
    interface.start_game(game, bank_user, bank_diler)
  end
end
