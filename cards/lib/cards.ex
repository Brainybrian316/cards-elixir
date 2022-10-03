defmodule Cards do

 def create_deck do
  #  Create a deck of cards using an array
  values = ["Ace", "Two",  "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

  suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

  # list comprehension
    for suit <- suits do  "is this a map?"
 end
 end

 def shuffle(deck) do
    Enum.shuffle(deck)
 end

#  the '?' after contains is convention to let other developers know this function returns a boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end
