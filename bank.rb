class Bank
  
  attr_accessor :banks_diler, :banks_user

  def initialize
  	@banks_user = 100
  	@banks_diler = 100
  end

  def bank_after_win_user
    @banks_user = @banks_user + 20
  end

  def bank_after_win_diler
    @banks_diler = @banks_diler + 20
  end

  def bank_after_draw
    @banks_user = @banks_user + 10
    @banks_diler = @banks_diler + 10
  end

end