class Bank
  attr_accessor :bank_user, :bank_diler

  def initialize(bank_user, bank_diler)
    @bank_user = bank_user
    @bank_diler = bank_diler
  end
end
