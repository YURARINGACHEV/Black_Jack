class Card

  attr_accessor :value, :suit

  VALUE = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUIT = ['+', '^', '<>', '<3']

	def initialize
		index = rand(13)
		@value = VALUE[index]
		@suit = SUIT[rand(4)]
	end

end