class Player
  attr_reader  :name
  attr_accessor :points #:bank_u, :bank_d

  def initialize(name, deck_of_card)
    @name = name
    @deck_of_card = deck_of_card
    @points = 0
  end
  
  # def all_bank_user(bank_user)
  #   @bank_u ||=0
  #   @bank_u = bank_user.banks_users 
  # end

  # def all_bank_user(banks_diler)
  #   @bank_d ||=0
  #   @bank_d = banks_diler.banks_diler 
  # end

end
