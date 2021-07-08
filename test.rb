Колоду определил в виде массива
@cards=["2+", "3+", "4+", "5+", "6+", "7+", "8+", "9+", "10+", "K+", "Q+", "J+", "A+",
        "2<3", "3<3", "4<3", "5<3", "6<3", "7<3", "8<3", "9<3", "10<3", "K<3", "Q<3", "J<3", "A<3",
        "2<>", "3<>", "4<>", "5<>", "6<>", "7<>", "8<>", "9<>", "10<>", "K<>", "Q<>", "J<>", "A<>",
        "2^", "3^", "4^", "5^", "6^", "7^", "8^", "9^", "10^", "K^", "Q^", "J^", "A^"]

shuffle?


Вариант составления колоды
cards = []
decks = ‘2345678TJQKA’
suits = ‘tkcp’ #trefl, karo, czerwień, pik
decks.each_byte do |deck|
suits.each_byte do |suit|
cards << deck.chr + suit.chr
end
end
Перемешать колоду
cards.shuffle.reverse.shuffle.reverse.shuffle



Реализуем класс Card. Каждая карта имеет название, количество очков и масть (задаются константами). Например:
class Card
def initialize
index = rand(13)
@face = FACE[index]
@value = VALUE[index]
@suit = SUIT[rand(4)]
end
В классе, отвечающем за логику игры, создаем массив, куда будем записывать розданные карты
cards = []
Реализуем раздачу карт дилеру или игроку
def deal(person,game)
card = Card.new #создаем карту (как бы достали карту из колоды)
person.hand << card unless game.cards.include? card #добавляем уникальную карту к раздаче
game.cards << card #добавляем карту в список розданных
end
В main раздаем по две карты игроку и дилеру
while player.hand.size < 2 { dealer.deal(player,game) }
while dealer.hand.size < 2 { dealer.deal(dealer,game) }
Все, имеем однозначно уникальные карты в раздаче.






Я делал так:
Туза считаем за единицу всегда и заодно проверяем, есть ли он вообще
Если есть - проверяем текущая сумма + 10 вписывается в ограничение по 21 или нет. Вписывается - плюсуем.
Проверять второго туза не имеет никакого смысла. +20 очков всегда перебор.