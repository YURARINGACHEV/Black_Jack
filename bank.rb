class Bank
  attr_accessor :banks_player

  def initialize
    @banks_player = 100
  end

  def auto_bet_player
    @banks_player -= 10
  end

  def bank_after_win
    @banks_player += 20
  end

  def bank_after_draw
    @banks_player += 10
  end
end
